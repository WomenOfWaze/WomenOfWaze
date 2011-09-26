require 'spec_helper'

describe SubCategory do
  describe "Happy Path" do
    subject { FactoryGirl.create :sub_category }
    its(:name) { should_not be_nil }
    its(:description) { should_not be_nil }
  end

  describe "validates presence of name" do
    subject {FactoryGirl.build(:sub_category, :name => "")}
    it {should_not be_valid}
  end

  describe "validates presence of description" do
    subject {FactoryGirl.build(:sub_category, :description => "")}
    it {should_not be_valid}
  end
 end