require "selenium-webdriver"

Given('I visit the website to login {string}') do |string|
  visit string
end

And ('I click login') do
  @page.landing_page.login_select
end

And('I am directed to {string}') do |string|
    visit string
end

When('I login with username {string}') do |string|
  sleep 2
  @page.landing_page.login_email_entry string
end

And('enter password {string} and log in') do |string|
  @page.landing_page.login_password_entry string
end

Then('I should see user {string}') do |string|
  sleep 1
  expect(@page.search_results_page.login_results_string).to eql(string)
end
