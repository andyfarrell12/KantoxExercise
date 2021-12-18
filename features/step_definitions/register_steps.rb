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
