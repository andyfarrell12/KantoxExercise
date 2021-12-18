
Feature: Extra Forex Search Test

  Background:

  Scenario: As a user I should be able to search for an earphone and get a matching result
    Given I visit the website to search "https://dictionary.cambridge.org/"
    When I search for "forex"
    Then I should see search results for "forex"
