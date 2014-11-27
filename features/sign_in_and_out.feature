Feature: Signing in to and out of Chitter
  In order to use Chitter
  As a person who has registered
  I want to be able to sign in and sign out

Background: Registering for Chitter
  Given I visit the homepage
  And I sign up
  Then I should see a welcome message

Scenario: Signing in to Chitter
  Given I sign out
  Then I should be able to sign in

Scenario: Attempting to sign in with incorrect details
  Given I have registered
  And I am signed out
  When I try to sign in with an incorrect username
  Then I should have to re-enter my details