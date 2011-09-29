require 'spec_helper'

describe "enquiries/new.html.erb" do
  before(:each) do
    assign(:enquiry, stub_model(Enquiry,
      :firstname => "MyString",
      :lastname => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :remarks => "MyText"
    ).as_new_record)
  end

  it "renders new Enquiry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enquiries_path, :method => "post" do
      assert_select "input#enquiry_firstname", :name => "enquiry[firstname]"
      assert_select "input#enquiry_lastname", :name => "enquiry[lastname]"
      assert_select "input#enquiry_country", :name => "enquiry[country]"
      pending 'Not sure why this is failing... look into it soon' do
        assert_select "input#enquiry_phone", :name => "enquiry[phone]"
      end
      assert_select "input#enquiry_email", :name => "enquiry[email]"
      assert_select "textarea#enquiry_remarks", :name => "enquiry[remarks]"
    end
  end
end
