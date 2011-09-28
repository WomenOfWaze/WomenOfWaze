require 'spec_helper'

describe "Enquiry" do
  subject(Factory.create  :enquiry)
  its(:firtname)  {should_not be_nil}
  its(:lastname) {should_not be_nil}
  its(:email) {should_not be_nil}
  its(:remark) {should_not be_nil}

  describe "validates_presence of firstname" do
    subject {FactoryGirl.build(:enquiry, :firstname => "")}
    it {should_not be_valid}
  end
  describe "validates_presence of lastname" do
    subject {FactoryGirl.build(:enquiry, lastname => "")}
    it {should_not be_valid}
  end

  describe "validates format of firstname, should not contain special characters" do
    subject {FactoryGirl.build(:enquiry, :firstname => "@^&*()")}
    it {should_not be_valid}
  end
  describe "validates format of lastname, should not contain special characters" do
    subject {FactoryGirl.build(:enquiry, lastname => ":)")}
    it {should_not be_valid}
  end


  describe "validates_presence of email" do
    subject {FactoryGirl.build(:enquiry, :email => "")}
    it {should_not be_valid}
  end
  describe "validates_presence of remarks" do
    subject {FactoryGirl.build(:enquiry, :remarks => "")}
    it {should_not be_valid}
  end
  describe "validates_length of phone country code" do
    subject {FactoryGirl.build(:enquiry, :phone_country_code => 12345)}
    it {should_not be_valid}
  end
  describe "validates_length of phone city code" do
    subject {FactoryGirl.build(:enquiry, :phone_city_code => 123)}
    it {should_not be_valid}
  end
  describe "validates_length of phone number" do
    subject {FactoryGirl.build(:enquiry, :phone_number => 12345678901)}
    it {should_not be_valid}
  end

end
