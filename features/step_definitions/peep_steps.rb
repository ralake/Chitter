Given(/^I write a peep$/) do
  click_button("Compose a peep")
  fill_in "message", with: "Everybody look at me! I'm peeping!"
  click_button("Post my peep")
end

Then(/^I should see the peep displayed on the homepage$/) do
  expect(page).to have_content("Everybody look at me! I'm peeping!")
end