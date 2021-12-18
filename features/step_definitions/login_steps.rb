require "selenium-webdriver"
require "rspec"

Given('I visit the website to login {string}') do |string|
  visit string
end

And ('I click login') do
  @page.landing_page.login_select
end

And('I am directed to {string}') do |string|
    visit string
end

When('I login with email {string}') do |string|
  sleep 2
  @page.landing_page.login_email_entry string
end

And('enter password {string} and click log in') do |string|
  @page.landing_page.login_password_entry string
end

Then('I should see user {string}') do |string|
  sleep 1
  expect(@page.search_results_page.login_results_string).to eql(string)
end

## -----------------------------------------------------------------------------
# Login with invalid fields

Then('I should see error {string}') do |string|
  sleep 1
  expect(@page.search_results_page.login_error_string).to eql(string)
end

## -----------------------------------------------------------------------------
# Login with missing fields

Then('I should see missing field error {string}') do |string|
  sleep 1
  expect(@page.search_results_page.missing_login_string).to eql(string)
end
