Feature: Register Tests

 Background:

   Given I visit the website to register "https://dictionary.cambridge.org/"
   And I click register
   And I am directed to register page "https://dictionary.cambridge.org/auth/signup?rid=amp-me7UXoogf0TRZFWvl0OU2g&return=https%3A%2F%2Fcdn.ampproject.org%2Fv0%2Famp-login-done-0.1.html%3Furl%3Dhttps%253A%252F%252Fdictionary.cambridge.org%252F"

 Scenario Outline: <testId> (Positive Test) As a new user I should be able to register

   # random string is put before email to make email unique
   When I register with new email "<email>"
   And enter first name "<firstName>"
   And enter last name "<lastName>"
   And enter password "<password>"
   And confirm password "<password>"
   And agree to terms and click register
   Then success message shown

   Examples:
    | testId | email                   |  password  | firstName | lastName |
    | 1      | @gmail.com              |  Password1 | test      | QA       |

# ------------------------------------------------------------------------------

  Scenario Outline: <testId> (Negative Test) Invalid email

    # email error is shown as soon as invalid email is inputted
    When I register with invalid email "<email>"
    Then email error is shown "E-mail address is invalid."

    Examples:
     | testId | email                   |
     | 1      | @gmail.com              |
     | 2      | @                       |
     | 3      | .com                    |
     | 4      | test                    |
     | 5      | gmail@gmail@gmail       |
     | 6      | &&&&                    |

## -----------------------------------------------------------------------------

Scenario Outline: <testId> (Negative Test) Missing mandatory fields

  When I register email "<email>"
  And enter first name "<firstName>"
  And enter last name "<lastName>"
  And enter password "<password>"
  And confirm password "<password2>"
  And agree to terms and click register
  Then missing field error is shown "This field is required"

  Examples:
   | testId | email                   |  password  | password2 | firstName | lastName |
   | 1      |                         |  Password1 | Password1 | test      | QA       |
   | 2      | test12435477@gmail.com  |            | Password1 | test      | QA       |
   | 3      | test67535376@gmail.com  |  Password1 | Password1 |           | QA       |
   | 4      | test67535376@gmail.com  |  Password1 | Password1 | test      |          |

## -----------------------------------------------------------------------------

Scenario Outline: <testId> (Negative Test) Passwords do not match

  When I register with new email "<email>"
  And enter first name "<firstName>"
  And enter last name "<lastName>"
  And enter password "<password>"
  And confirm password "<password2>"
  Then password match error is shown "Passwords do not match"

  Examples:
   | testId | email       |  password  | password2 | firstName | lastName |
   | 1      | @gmail.com  |  Passw45&& | Password1 | test      | QA       |
   | 2      | @gmail.com  |  RTgsst4%  | Password1 | test      | QA       |
   | 3      | @gmail.com  |  Password1 | Gbhsgt34$ | test      | QA       |
   | 4      | @gmail.com  |  Password1 | Msgstb55£ | test      | QA       |

## -----------------------------------------------------------------------------

Scenario Outline: <testId> (Negative Test) As a new user I should be able to register

  # random string is put before email to make email unique
  When I register with new email "<email>"
  And enter first name "<firstName>"
  And enter last name "<lastName>"
  And enter password "<password>"
  And confirm password "<password>"
  And Do Not agree to terms and click register
  Then terms box is highlighted red

  Examples:
   | testId | email                   |  password  | firstName | lastName |
   | 1      | @gmail.com              |  Password1 | test      | QA       |
