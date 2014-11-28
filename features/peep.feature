Feature: Creating a peep
  In order to share my opinions
  As a person who has registered with Chitter
  I want to create a peep

Background: Registering and signing in to Chitter
  Given I visit the homepage
  And I sign up
  Then I should see a welcome message

Scenario: Writing peeps
  Given I write some peeps
  Then I should see the peeps displayed in chronological order 
  