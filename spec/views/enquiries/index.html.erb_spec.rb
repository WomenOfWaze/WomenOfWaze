require 'spec_helper'

describe "enquiries/index.html.erb" do
  before(:each) do
    assign(:enquiries, [
      stub_model(Enquiry,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :country => "Country",
        :phone_country_code => 12,
        :phone_city_code => 3456,
        :phone_number => 7891011123,
        :email => "Email",
        :remarks => "MyText"
      ),
      stub_model(Enquiry,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :country => "Country",
        :phone_country_code => 12,
        :phone_city_code => 3456,
        :phone_number => 7891011123,
        :email => "Email",
        :remarks => "MyText"
      )
    ])
  end

  it "renders a list of enquiries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone-Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
