Feature: Cucumber Demo Medium imports its demo content
  As a site administrator
  I want the medium demo to add one Product and its feature directory terms
  So that a medium company has a richer example to start from

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The demo Product is listed on the Products page
    When I navigate to "/products"
    Then I should see "Varbase"

  Scenario: The demo Product was imported with its media
    When I navigate to "/admin/content"
    Then I should see "Varbase"
    When I navigate to "/node/1/edit"
    Then I should see "Edit Product"
     And "#edit-title-0-value" should have value "Varbase"

  Scenario: The medium demo feature directory terms are imported
    When I navigate to "/admin/structure/taxonomy/manage/feature_directory/overview"
    Then I should see "01-website-base-requirements"
     And I should see "02-user-management"
     And I should see "03-admin-management"
     And I should see "04-content-structure"
     And I should see "05-content-management"

  # Same upstream cucumber_core `features` view block gap as the small demo.
  @wip
  Scenario: The demo Product node page renders
    When I navigate to "/products/varbase"
    Then I should see "Varbase"
