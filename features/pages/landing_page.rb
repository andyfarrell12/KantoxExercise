require 'SecureRandom'

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

  def register_select
    find('#onetrust-accept-btn-handler').click
    find('[class="lpl-0 hbtn hbtn-t lmt-5 fs15 cdo-register-button"]').click
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

  def register_email_entry string
    find('[name="email"]').click
    ## Using Secure Random so that every time the user registers the test
    ## uses a different email
    find('[name="email"]').set(SecureRandom.hex(8) + string)
  end

  def register_first_name_entry string
    find('[name="profile.firstName"]').click
    find('[name="profile.firstName"]').set(string)
  end

  def register_last_name_entry string
    find('[name="profile.lastName"]').click
    find('[name="profile.lastName"]').set(string)
  end

  def register_password_entry string
    find('[name="password"]').click
    find('[name="password"]').set(string)
  end

  def register_confirm_password_entry string
    find('[name="passwordRetype"]').click
    find('[name="passwordRetype"]').set(string)
  end

  def register_agree_terms_entry
    first('[name="data.press.terms.v1.blnAccepted"]').click
    find('[type="submit"]').click
  end

  def register_incorrect_email_entry string
    find('[name="email"]').click
    find('[name="email"]').set(string)
  end

  def click_register
    find('[type="submit"]').click
  end

end
