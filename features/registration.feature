Feature: Registering for Chitter
  In order to use Chitter
  As a person with specific details and plenty of biased opinions
  I want to register to use Chitter

Scenario: Registering for Chitter
  Given I visit the homepage
  When I sign up
  Then I should see a welcome message

Scenario: Attempting to sign up with a username or email that already exists
  Given I visit the homepage
  When I try to sign up with an existing username and email
  Then I should be warned that they are already in use
