Feature: Cucumber Demo Small imports its demo content
  As a site administrator
  I want the small demo to add one Project and its feature directory terms
  So that a small company has something to look at right after install

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The demo Project is listed on the Projects page
    When I navigate to "/projects"
    Then I should see "Webship.co"

  Scenario: The demo Project was imported with its fields
    When I navigate to "/admin/content"
    Then I should see "Webship.co"
    When I click "Webship.co"
     And I navigate to "/node/2/edit"
    Then I should see "Edit Project"
     And "#edit-title-0-value" should have value "Webship.co"
     And "#edit-field-project-name-0-value" should have value "WSCO"

  Scenario: The small demo feature directory terms are imported
    When I navigate to "/admin/structure/taxonomy/manage/feature_directory/overview"
    Then I should see "Permissions"
     And I should see "Validations"
     And I should see "Users"
     And I should see "Links"
     And I should see "Elements"

  # Known upstream gap, kept out of CI with `--tags "not @wip"`.
  #
  # /projects/{node} returns HTTP 500. The `full` view display that
  # cucumber_recipes ships for the Project type embeds
  # `views_block:features-features_block`, and that block display of
  # cucumber_core's `features` view has a contextual filter with an empty
  # entity type, so rendering it throws
  # `PluginNotFoundException: The "" entity type does not exist`.
  # The fix belongs in cucumber_core, not here.
  @wip
  Scenario: The demo Project node page renders
    When I navigate to "/projects/webshipco"
    Then I should see "Webship.co"
     And I should see "automated functional testing"
