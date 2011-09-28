require 'spec_helper'

describe "Enquirys/new.html.erb" do
  before(:each) do
    assign(:Enquiry, stub_model(Enquiry,
      :firstname => "MyString",
      :lastname => "MyString",
      :country => "MyString",
      :phone_country_code => "MyString",
      :phone_city_code => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :remarks => "MyText"
    ).as_new_record)
  end

  it "renders new Enquiry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enquiries_path, :method => "post" do
      assert_select "input#Enquiry_firstname", :name => "Enquiry[firstname]"
      assert_select "input#Enquiry_lastname", :name => "Enquiry[lastname]"
      assert_select "input#Enquiry_country", :name => "Enquiry[country]"
      assert_select "input#Enquiry_phone_country_code", :name => "Enquiry[phone_country_code]"
      assert_select "input#Enquiry_email", :name => "Enquiry[email]"
      assert_select "textarea#Enquiry_remarks", :name => "Enquiry[remarks]"
    end
  end
end
