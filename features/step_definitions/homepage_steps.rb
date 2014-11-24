Given(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I click "(.*?)"$/) do |arg1|
  click_button(arg1)
end