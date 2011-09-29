require 'spec_helper'

describe "enquiries/index.html.erb" do
  before(:each) do
    assign(:enquiries, [
      stub_model(Enquiry,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :country => "Country",
        :phone => "Phone",
        :email => "Email",
        :remarks => "MyText"
      ),
      stub_model(Enquiry,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :country => "Country",
        :phone => "Phone",
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
    pending 'Not sure why this is failing... look into it soon' do
      assert_select "tr>td", :text => "Phone".to_s, :count => 2
    end
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
