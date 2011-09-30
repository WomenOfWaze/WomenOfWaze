Feature: Send a product enquiry
  As a web visitor
  I want to be able to enquire about a product
  In order to get it someday

  Scenario: Send product enquiry
    Given a product exists with a name of "Red Jewelry Bag"
      And the following Users exist:
        | Email |
        | admin_gupta@wow.com |
        | admin_bhens@wow.com |
      And I am on the product enquiry page for "Red Jewelry Bag"
     When I fill in "Firstname" with "Abhishek"
      And I fill in "Lastname" with "Sharma"
      And I fill in "Country" with "India"
      And I fill in "Contact Number" with "022 3525 255"
      And I fill in "Email" with "abhishek.sharma@gmail.in"
     Then the "Interest Area" field should contain "I am interested in buying Product Red Jewelry Bag with Code"
     When I press "Submit"
     Then "admin_gupta@wow.com" should receive an email
      And "admin_bhens@wow.com" should receive an email
     When they open the email
     Then they should see "Enquiry From - Abhishek Sharma" in the email subject
      And they should see "Please attend to the following request" in the email body
      And I should be on the product catalogue page
      And I should see "Thank you for inquiries. We shall get in touch with you soon."
