# Cucumber Demos - webship-js feature scenarios

| File | Covers |
|------|--------|
| `01-01-01-users-login.feature` | Per-role login; the first scenario provisions the testing users. |
| `02-01-01-cucumber-demos-modules-enabled.feature` | The small, medium and large demo modules, plus the Cucumber Recipes modules they import into, are enabled. |
| `03-01-01-demo-small-content.feature` | The small demo's Project ("Webship.co") and its five feature directory terms. |
| `03-02-01-demo-medium-content.feature` | The medium demo's Product ("Varbase") and its five feature directory terms. |
| `03-03-01-demo-large-ships-no-content.feature` | Cucumber Demo Large installs but adds no content: `/admin/content` still holds only the small and medium demo nodes. |

Two scenarios are tagged `@wip`: the demo nodes' canonical pages return
HTTP 500 because the `full` view display cucumber_recipes ships embeds
cucumber_core's `features` view block, which throws on render. CI
excludes them.
