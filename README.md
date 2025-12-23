# Solving circular dependencies in Microsoft.Build.SQL using stubs

## Background

This repository demonstrates a problematic database design where databases have circular dependencies on one another. In real-world systems the dependency graph can be much larger and more tangled, producing situations where several databases depend on each other for objects such as tables, functions, or stored procedures. Why teams end up with circular designs are not important, but it is any case a situation newer members inherit and must solve.

## Problem

Circular references become problematic when databases are placed under version control or when automated deployments are required (the chicken-and-egg problem). Removing all circular dependencies is often difficult, so being able to version and deploy databases despite those dependencies can help teams gradually improve the design.

## Proposed solution (and its issue)

A common workaround is to create and maintain stub projects that declare only the objects needed to break the dependency cycle. It is often recommended to only define the "shape" of the required object, so that the created stub have no dependencies in turn. This repository shows a case where that approach currently fails:

- Apple.Stubs.sqlproj builds successfully.
- Banana.sqlproj builds successfully.
- Apple.sqlproj fails with: Build error SQL71508: The model already has an element that has the same name dbo.Pie.

In this example Banana requires dbo.Pie from Apple, so a stub is first created in Apple.Stubs. When the full Apple project is later built, dbo.Pie is redefined using the complete definition, but Microsoft.Build.SQL reports SQL71508 and does not accept the updated definition even when Apple has a same-database reference to Apple.Stubs.

In realistic projects this need for stubs can be extensive, covering many object types, which makes the inability to replace stub definitions a significant obstacle.

**TODO: fix SQL71508**

References:
- https://www.sqlservercentral.com/articles/two-approaches-to-addressing-circular-references-in-ssdt
- https://web.archive.org/web/20220527001729/https://blogs.solidq.com/en/sqlserver/ssdt-how-to-solve-the-circular-references-issue/
- https://www.red-gate.com/hub/product-learning/flyway/dealing-with-mutually-dependent-databases-in-flyway

