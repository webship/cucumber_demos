# Cucumber Demos

Provides demo content for the Cucumber Automated Functional Acceptance
Testing Management system, in three company sizes, so a fresh Cucumber
site has something real to look at instead of empty listings.


## Table of contents

- Features
- Requirements
- Installation
- Usage


## Features

Three modules ship in this package. Each one imports its content on
install with Drupal core's default content importer, the same one
recipes use. The content lives in a recipe inside the module, at
`recipes/cucumber-demo-<size>/content/`, and `hook_install()` applies
that recipe.

| Module | Imports | Depends on |
|--------|---------|------------|
| `cucumber_demo_small` | One Project, "Webship.co" | `cucumber_projects` |
| `cucumber_demo_medium` | One Product, "Varbase" | `cucumber_products`, `cucumber_projects` |
| `cucumber_demo_large` | Nothing yet | - |

**Cucumber Demo Small** imports one Project node, four Feature media
items, one image file for the project logo, and five `feature_directory`
taxonomy terms: Permissions, Validations, Users, Links and Elements.

**Cucumber Demo Medium** imports one Product node, forty-one Feature
media items, and five `feature_directory` taxonomy terms:
`01-website-base-requirements`, `02-user-management`,
`03-admin-management`, `04-content-structure` and
`05-content-management`.

**Cucumber Demo Large** currently ships no content. It has no recipe,
so installing it enables the module and adds nothing to the site. It is a placeholder for a large company data set that has not been
written yet.


## Requirements

Drupal core `^11.4 || ^12`, plus the packages listed in
`composer.json`:

- [Webpatches](https://www.drupal.org/project/webpatches)
- [Cucumber Core](https://www.drupal.org/project/cucumber_core)
- [Cucumber Recipes](https://www.drupal.org/project/cucumber_recipes)

The small and medium demos import into the Project and Product content
types, which come from the Cucumber Recipes modules
(`cucumber_projects` and `cucumber_products`).

The contrib [Default Content](https://www.drupal.org/project/default_content)
module is no longer needed. Content that a site already imported with
it keeps its UUIDs, so installing a demo again skips it instead of
creating duplicates. Sites that had it installed only for these demos
can uninstall it; if Composer has already removed its code, `drush updb`
removes it from the list of installed modules.


## Installation

Install as you would normally install a contributed Drupal module:

```
composer require drupal/cucumber_demos drupal/cucumber_recipes
drush en cucumber_demo_small
```

Pick one size. Installing more than one is supported - the content sets
do not overlap - but a site normally wants a single demo.

A demo recipe can also be applied on its own, for example to restore
deleted demo content on a site that has the module installed:

```
drush recipe modules/contrib/cucumber_demos/cucumber_demo_small/recipes/cucumber-demo-small
```

Entities that still exist are left as they are.


## Usage

After install, review the imported content at `/admin/content`, the
imported media at `/admin/content/media`, and the feature directory
terms at `admin/structure/taxonomy/manage/feature_directory/overview`.
The demo Project and Product also appear on the `/projects` and
`/products` listing pages.

Automated functional tests for these modules live in `tests/` and are
run with [webship-js](https://www.npmjs.com/package/webship-js); see
`tests/README.md`.
