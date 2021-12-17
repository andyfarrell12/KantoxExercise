class SearchResultsPage

  include BasePage

  def search_results_string
    first('[class="hw dhw"]').text
  end

  def login_results_string
    find('[class="tb lpl-2 cdo-username"]').text
  end

end
