Given(/^I am not logged in$/) do
end

When(/^I go to the job list$/) do
    visit "/"
end

Then(/^I should not see any forms$/) do
    expect(response).not_to have_selector("form")
end

Given(/^I am logged in$/) do
  visit "/admin"
  
end

Then(/^I should see forms$/) do
  pending # Write code here that turns the phrase above into concrete actions
end