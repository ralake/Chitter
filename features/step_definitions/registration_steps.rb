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
