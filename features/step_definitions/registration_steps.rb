Given(/^I visit the homepage$/) do
  visit '/'
  expect(page).to have_content("Chitter")
end

When(/^I sign up$/) do
  click_button("Sign up")
  fill_in "name", with: "Rich"
  fill_in "username", with: "rich_maker"
  fill_in "email", with: "rich@lake.com"
  fill_in "password", with: "password2014"
  click_button("Register")
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_content("Welcome to Chitter Rich!")
  expect(page).not_to have_button("Sign up")
end

When(/^I try to sign up with an existing username$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be asked to try another username$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I try to sign up with an email that is already associated with an account$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be warned and asked to provide a different email address$/) do
  pending # express the regexp above with the code you wish you had
end