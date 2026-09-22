Feature: The Cucumber Demos modules are enabled
  As a site administrator
  I want the small, medium and large demo modules installed on plain Drupal
  So that a new Cucumber site can be filled with example testing content

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The three demo modules are listed as enabled
    When I navigate to "/admin/modules"
    Then I should see "Cucumber Demo Small"
     And I should see "Cucumber Demo Medium"
     And I should see "Cucumber Demo Large"
     And the element "#edit-modules-cucumber-demo-small-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-cucumber-demo-medium-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-cucumber-demo-large-enable" with the attribute "checked" and the value "checked" should exist

  Scenario: The modules the demos import their content with are enabled
    When I navigate to "/admin/modules"
    Then the element "#edit-modules-default-content-enable" with the attribute "checked" and the value "checked" should not exist
     And the element "#edit-modules-cucumber-projects-enable" with the attribute "checked" and the value "checked" should exist
     And the element "#edit-modules-cucumber-products-enable" with the attribute "checked" and the value "checked" should exist
