Feature: Allow a registered user to login
  
  Scenario: Login should be successful with valid email and password
    Given I am a registered user
    And I am on "the login page"
    And I fill in "user_email" with "student100@example.com"
    And I fill in "user_password" with "password"
    And I press "Sign in"
  