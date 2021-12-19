require "selenium-webdriver"
require "rspec"

Given('I visit the website to register {string}') do |string|
  visit string
end

And ('I click register') do
  @page.landing_page.register_select
end

And('I am directed to register page {string}') do |string|
    visit string
end

When('I register with new email {string}') do |string|
  sleep 2
  @page.landing_page.register_email_entry string
end

And('enter first name {string}') do |string|
  @page.landing_page.register_first_name_entry string
end

And('enter last name {string}') do |string|
  @page.landing_page.register_last_name_entry string
end

And('enter password {string}') do |string|
  @page.landing_page.register_password_entry string
end

And('confirm password {string}') do |string|
  @page.landing_page.register_confirm_password_entry string
end

And ('agree to terms and click register') do
  @page.landing_page.register_agree_terms_entry
end

Then('success message shown') do
  @page.search_results_page.successful_register
end

# ------------------------------------------------------------------------------
## invalid email Tests

When('I register with invalid email {string}') do |string|
  sleep 2
  @page.landing_page.register_incorrect_email_entry string
end

Then('email error is shown {string}') do |string|
  expect(@page.search_results_page.email_error_string).to eql string
end

# ------------------------------------------------------------------------------
## missing mandatory field

When('I register email {string}') do |string|
  sleep 2
  @page.landing_page.register_incorrect_email_entry string
end

Then('missing field error is shown {string}') do |string|
  expect(@page.search_results_page.register_error_string).to eql string
end

# ------------------------------------------------------------------------------
## password match Tests

Then('password match error is shown {string}') do |string|
  expect(@page.search_results_page.register_error_string).to eql string
end

# ------------------------------------------------------------------------------
## Do not click accept terms test

And('Do Not agree to terms and click register') do
  @page.landing_page.click_register
end

Then('terms box is highlighted red') do
  @page.search_results_page.terms_error
end
