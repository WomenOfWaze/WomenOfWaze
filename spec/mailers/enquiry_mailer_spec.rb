require "spec_helper"

describe EnquiryMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  
  before(:all) do
    enquiry = Enquiry.new
    enquiry.email = "foo.example.com"
    enquiry.firstname = "foo"
    enquiry.lastname = "bar"

    user = User.new(:email => "admin@example.com")
    User.stub(:all).and_return([user])
    @email = EnquiryMailer.enquiry_mail(enquiry)
  end

  it "should be set to be delivered to the email passed in" do
    @email.should deliver_to("admin@example.com")
  end

end
