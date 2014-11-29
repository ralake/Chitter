Given(/^I visit the homepage$/) do
  visit '/'
  expect(page).to have_content("Chitter")
end

When(/^I sign up$/) do
  click_link("Sign up")
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

When(/^I try to sign up with an existing username and email$/) do
   User.create(:name => "Rich",
              :username => "rich_maker",
              :email => "rich@lake.com",
              :password => "test")
  click_link("Sign up")
  fill_in "name", with: "Rich"
  fill_in "username", with: "rich_maker"
  fill_in "email", with: "rich@lake.com"
  fill_in "password", with: "password2014"
  click_button("Register")
end

Then(/^I should be warned that they are already in use$/) do
  expect(page).to have_content("Email is already taken")
  expect(page).to have_content("Username is already taken")
end