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
     When I fill in "enquiry_firstname" with "Abhishek"
      And I fill in "enquiry_lastname" with "Sharma"
      And I fill in "enquiry_country" with "India"
      And I fill in "enquiry_phone_number" with "022 3525 255"
      And I fill in "enquiry_email" with "abhishek.sharma@gmail.in"
     Then the "Area of Interest" field should contain "I am interested in buying Product Red Jewelry Bag with Code"
     When I press "Submit"
     Then "womenofwaze@gmail.com" should receive an email
      # And "admin_bhens@wow.com" should receive an email
     When they open the email
     Then they should see "Enquiry From - Abhishek Sharma" in the email subject
      And they should see "Please attend to the following request" in the email body
      And I should be on the product catalogue page
      And I should see "Thank you for inquiries. We shall get in touch with you soon."
