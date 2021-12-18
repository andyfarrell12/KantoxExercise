class SearchResultsPage

  include BasePage

  def search_results_string
    first('[class="hw dhw"]').text
  end

  def login_results_string
    find('[class="tb lpl-2 cdo-username"]').text
  end

  def login_error_string
    find('[class="gigya-error-msg gigya-form-error-msg gigya-error-code-403042 gigya-error-msg-active"]').text
  end

  def missing_login_string
    first('[class="gigya-error-msg gigya-error-msg-active gigya-error-code-400027 gigya-error-type-server"]').text
  end

end
