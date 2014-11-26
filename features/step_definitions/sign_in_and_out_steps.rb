
Given(/^I sign in$/) do
  User.create(:name => "Rich",
            :username => "rich_maker",
            :email => "rich@lake.com",
            :password => "tester")
  visit '/'
  click_button("Sign in")
  fill_in "username", with: "rich_maker"
  fill_in "password", with: "tester"
  click_button("Go!")
end

Then(/^I should be able to sign out$/) do
  click_button("Sign out")
  expect(page).to have_content("See you soon!")
end
