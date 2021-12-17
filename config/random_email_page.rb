require 'securerandom'

class RandomEmail

  include BasePage

  def generate_email
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  puts generate_email(20)

end
