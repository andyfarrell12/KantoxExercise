Feature: Login Tests

 Background:

   Given I visit the website to login "https://dictionary.cambridge.org/"
   And I click login
   And I am directed to "https://dictionary.cambridge.org/auth/signin?rid=amp-me7UXoogf0TRZFWvl0OU2g&return=https%3A%2F%2Fcdn.ampproject.org%2Fv0%2Famp-login-done-0.1.html%3Furl%3Dhttps%253A%252F%252Fdictionary.cambridge.org%252F"

 Scenario Outline: (Positive Test) As a user I should be able to login with an existing account

   When I login with username "<email>"
   And enter password "<password>" and click log in
   Then I should see user "Andy Farrell"

   Examples:
    | email                   |  password  |
    | andyfarrell12@gmail.com |  Password1 |
# holding these fields in an examples table as it is easier to maintain if any changes occur, also it is more readable

# ------------------------------------------------------------------------------

 Scenario Outline: <testId> (Negative Tests) Invalid login details entered

  When I login with username "<email>"
  And enter password "<password>" and click log in
  Then I should see error "Invalid login or password"

  Examples:
   | testId | email                   |  password  |
   | 1      | andyfarrell18@gmail.com |  Password1 | # incorrect email
   | 2      | @gmail.com              |  Password1 | # incorrect email
   | 3      | £££@gmail.com           |  Password1 | # incorrect email
   | 4      | 123@gmail.com           |  Password1 | # incorrect email
   | 5      | andyfarrell12           |  Password1 | # incorrect email
   | 6      | .com                    |  Password1 | # incorrect email
   | 7      | andyfarrell12@gmail.com |  Pass      | # incorrect password
   | 8      | andyfarrell12@gmail.com |  123       | # incorrect password

# ------------------------------------------------------------------------------

 Scenario Outline: <testId> (Negative Tests) Missing mandatory login data

  When I login with username "<email>"
  And enter password "<password>" and click log in
  Then I should see missing field error "This field is required"

  Examples:
   | testId | email                   |  password  |
   | 1      |                         |  Password1 | # missing email
   | 2      | andyfarrell98@gmail.com |            | # missing password
   | 3      |                         |            | # missing username and password
