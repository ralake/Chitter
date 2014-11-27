Feature: Creating a peep
  In order to share my opinions
  As a person who has registered with Chitter
  I want to create a peep

Background: Registering and signing in to Chitter
  Given I visit the homepage
  And I sign up
  Then I should see a welcome message

Scenario: Writing a peep
  Given I write a peep
  Then I should see the peep displayed on the homepage