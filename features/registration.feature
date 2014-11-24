Feature: Registering for Chitter
  In order to use Chitter
  As a person with specific details and plenty of biased opinions
  I want to register to use Chitter

Scenario: Registering for Chitter
  Given I visit the homepage
  And I sign up
  Then I should see a welcome message
