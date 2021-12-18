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
