Feature: Login Tests

 Background:

   Given I visit the website to login "https://dictionary.cambridge.org/"
   And I click login
   And I am directed to "https://dictionary.cambridge.org/auth/signin?rid=amp-me7UXoogf0TRZFWvl0OU2g&return=https%3A%2F%2Fcdn.ampproject.org%2Fv0%2Famp-login-done-0.1.html%3Furl%3Dhttps%253A%252F%252Fdictionary.cambridge.org%252F"

 Scenario Outline: (Positive Test) As a user I should be able to login with an existing account

   When I login with username "<email>"
   And enter password "<password>" and log in
   Then I should see user "Andy Farrell"

   Examples:
    | email                   |  password  |
    | andyfarrell12@gmail.com |  Password1 |
