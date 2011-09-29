require "spec_helper"

describe EnquiryMailer do
 include EmailSpec::Helpers
 include EmailSpec::Matchers

 let(:enquiry) {
   Enquiry.new(:email => "rocky@jaiswal.com",
               :firstname => 'Rocky',
               :lastname =>'Jaiswal',
               :country => 'India',
               :phone_number => '+91 022 3525 255',
               :remarks => 'I am interested in the Jute Bag #17 with Code 1000'
    ) }
 let(:user)    { User.new(:email => "admin@example.com") }
 before do
   User.stub(:all).and_return([user])
 end
 subject { EnquiryMailer.enquiry_mail(enquiry) }

 it { should deliver_to("admin@example.com") }
 it { should have_subject("Enquiry From - Rocky Jaiswal") }
 it { should have_body_text("Requestor First Name - Rocky") }
 it { should have_body_text("Requestor Last Name - Jaiswal") }
 it { should have_body_text("Requestor Country - India") }
 it { should have_body_text("Requestor Phone - +91 022 3525 255") }
 it { should have_body_text("Requestor Email - rocky@jaiswal.com") }
 it { should have_body_text("Remarks - I am interested in the Jute Bag #17 with Code 1000") }
end
