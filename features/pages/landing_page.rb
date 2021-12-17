class LandingPage

  include BasePage

  def search_string string
    find('#onetrust-accept-btn-handler').click
    find('#searchword').click
    find('#searchword').set(string)
    find('[type="submit"]').click
  end

  def login_select
    find('#onetrust-accept-btn-handler').click
    find('[class="i i-user iw hv-2 lmr-5 fs15 fs16-s"]').click
  end

  def login_email_entry string
    find('[name="username"]').click
    find('[name="username"]').set(string)
  end

  def login_password_entry string
    find('[name="password"]').click
    find('[name="password"]').set(string)
    find('[type="submit"]').click
  end

end
