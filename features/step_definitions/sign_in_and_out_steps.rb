
Given(/^I sign out$/) do
  click_button("Sign out")
  expect(page).to have_content("See you soon!")
end

Then(/^I should be able to sign in$/) do
  visit '/'
  click_button("Sign in")
  fill_in "username", with: "rich_maker"
  fill_in "password", with: "password2014"
  click_button("Go!")
end

Given(/^I have registered$/) do
  expect(User.first.email).to eq("rich@lake.com")
end

Given(/^I am signed out$/) do
  click_button("Sign out")
end

When(/^I try to sign in with an incorrect email or username$/) do
  click_button("Sign in")
  fill_in "username", with: "richmaker"
  fill_in "password", with: "password2015"
  click_button("Go!")
end

Then(/^I should have to re\-enter my details$/) do
  expect(page).to have_content("The username or password is incorrect. Please try again.")
end
