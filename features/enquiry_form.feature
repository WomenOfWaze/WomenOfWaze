Feature: View the enquiry page
  As a web visitor
  I want to be able to view the enquiry page
  In order to fill in the enquiry form


Feature: Allow an user to view the Enquiry form

  Scenario: Enquiry should be successful with valid firstname. lastname, email and remarks.
    Given I am a user
    And I am on "the enquiries page"
    And I should see "First name"
    And I fill in "user_first_name" with "doel"
    And I press "Sign in"
    Then I am on the home page