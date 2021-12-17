Given('I visit the website to search {string}') do |string|
  visit string
end

When('I search for {string}') do |string|
  sleep 1
  @page.landing_page.search_string string
end

Then('I should see search results for {string}') do |string|
  sleep 1
  expect(@page.search_results_page.search_results_string).to eql(string)
end
