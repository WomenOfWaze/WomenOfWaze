require 'spec_helper'

describe "enquiries/edit.html.erb" do
  before(:each) do
    @enquiry = assign(:enquiry, stub_model(Enquiry,
      :firstname => "MyString",
      :lastname => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :remarks => "MyText"
    ))
  end

  it "renders the edit enquiry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enquiries_path(@enquiry), :method => "post" do
      assert_select "input#enquiry_firstname", :name => "enquiry[firstname]"
      assert_select "input#enquiry_lastname", :name => "enquiry[lastname]"
      assert_select "input#enquiry_country", :name => "enquiry[country]"
      assert_select "input#enquiry_phone", :name => "enquiry[phone]"
      assert_select "input#enquiry_email", :name => "enquiry[email]"
      assert_select "textarea#enquiry_remarks", :name => "enquiry[remarks]"
    end
  end
end
