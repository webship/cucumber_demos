Feature: Cucumber Demo Large ships no demo content yet
  As a site administrator
  I want an honest check of what the large demo actually installs today
  So that the suite documents the gap instead of hiding it

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The large demo installs, but adds no content of its own
    When I navigate to "/admin/content"
    Then I should see "Webship.co"
     And I should see "Varbase"
     And the table ".views-table" should have 2 rows
