Given(/^I write some peeps$/) do
  post_peep("First peep")
  post_peep("Second peep")
end

Then(/^I should see the peeps displayed in chronological order$/) do
  expect(page).to have_content("First peep")
  page.body.index("Second peep").should < page.body.index("First peep")
end

def post_peep(peep)
  fill_in "message", with: peep
  click_button("Post my peep")
end