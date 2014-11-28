Given(/^I write a peep$/) do
  post_peep("Everybody look at me! I'm peeping!")
end

Then(/^I should see the peep displayed on the homepage$/) do
  save_and_open_page
  expect(page).to have_content("Everybody look at me! I'm peeping!")
end

Given(/^I have written a few peeps$/) do
  post_peep("First peep")
  post_peep("Second peep")
end

Then(/^I should see the peeps displayed in chronological order$/) do
  page.body.index("Second peep").should < page.body.index("First peep")
  save_and_open_page
end

def post_peep(peep)
  click_button("Compose a peep")
  fill_in "message", with: peep
  click_button("Post my peep")
end