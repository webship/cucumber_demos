# Cucumber Demos tests

[webship-js](https://www.npmjs.com/package/webship-js) (Playwright +
Cucumber-js) suite, run against plain Drupal core.

The demo modules depend on the Cucumber Recipes modules for the content
types they import into, but `composer.json` does not require
`drupal/cucumber_recipes`, so install it alongside:

```bash
ddev composer require drupal/cucumber_recipes
ddev drush site:install standard --account-name=webmaster --account-pass=dD.123123ddd -y
ddev drush en cucumber_core -y
# Cucumber Core's batch install leaves Media Directories UI's own config and
# the optional `views.view.features` uninstalled. The Cucumber Recipes
# modules hard-depend on `views.view.features`, so re-run the installer.
ddev drush ev '\Drupal::service("config.installer")->installDefaultConfig("module","media_directories_ui"); \Drupal::service("config.installer")->installOptionalConfig();'
ddev drush en cucumber_components cucumber_products cucumber_projects -y
ddev drush en cucumber_demo_small cucumber_demo_medium cucumber_demo_large -y
yarn install
./node_modules/.bin/playwright install --with-deps chromium
LAUNCH_URL="https://<project>.ddev.site" yarn test
```

CI: the `webship-js-test` job in `.gitlab-ci.yml`, which runs
`--tags "not @wip"`.
