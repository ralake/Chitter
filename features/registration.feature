Feature: Registering for Chitter
  In order to use Chitter
  As a person with specific details and plenty of biased opinions
  I want to register to use Chitter

Scenario: Registering for Chitter
  Given I visit the homepage
  When I sign up
  Then I should see a welcome message

Scenario: Attempting to sign up with a username that already exists
  Given I visit the homepage
  When I try to sign up with an existing username
  Then I should be asked to try another username

Scenario: Attempting to sign up with an email that is already associated with a Chitter account
  Given I visit the homepage
  When I try to sign up with an email that is already associated with an account
  Then I should be warned and asked to provide a different email address