Feature: Visiting the Chitter homepage
  In order to register for Chitter
  As a person in need of some validation of his opinions from the masses
  I want to use Chitter

Scenario: Visit the homepage
  Given I visit the homepage
  Then I should see "Chitter" 

Scenario: Registering for Chitter
  Given I visit the homepage
  And I click "Sign up"
  Then I should see "Chitter Registration"