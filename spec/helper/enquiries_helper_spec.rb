require 'spec_helper'

describe EnquiriesHelper do

  it "should return the complete phone number with the country and city code" do
  enquiry = Factory(:enquiry)
  helper.complete_phone_number(enquiry).should == 1234121234567809
end

  it "should display the fullname of the person" do
   enquiry = Factory(:enquiry, :firstname => "hi", :lastname => "bye")
  helper.fullname(enquiry).should == "Hi Bye"
  end
end