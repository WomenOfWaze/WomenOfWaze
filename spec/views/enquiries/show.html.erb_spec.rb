require 'spec_helper'

describe "enquiries/show.html.erb" do
  before(:each) do
    @enquiry = assign(:Enquiry, stub_model(Enquiry,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :country => "Country",
      :phone_number => "Phone",
      :email => "Email",
      :remarks => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render("<font size='+4' color='green'>Thank you for queries.</font>")
    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Firstname/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Lastname/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Country/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Phone-Number/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Email/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/MyText/)
  end
end
