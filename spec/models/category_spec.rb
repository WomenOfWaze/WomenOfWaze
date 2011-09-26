require 'spec_helper'

describe Category do
  describe "Happy Path" do
    subject { FactoryGirl.create :category }
    its(:name) { should_not be_nil }
    its(:description) { should_not be_nil }
  end

  describe "validates presence of name" do
    subject {FactoryGirl.build(:category, :name => "")}
    it {should_not be_valid}
  end

  describe "validates presence of description" do
    subject {FactoryGirl.build(:category, :description => "")}
    it {should_not be_valid}
  end
end


