require 'spec_helper'

describe Product do
  describe "Happy Path" do
    subject { FactoryGirl.create :product }
    its(:name) { should_not be_nil }
    its(:description) { should_not be_nil }
    its(:price) { should_not be_nil }
    its(:size) { should_not be_nil }
    its(:photo) { should_not be_nil }
  #product code generation
  end

  describe "validates presence of name" do
    subject {FactoryGirl.build(:product, :name => "")}
    it {should_not be_valid}
  end

  describe "validates presence of description" do
    subject {FactoryGirl.build(:product, :description => "")}
    it {should_not be_valid}
  end

  describe "validates presence of price" do
    subject {FactoryGirl.build(:product, :price => "")}
    it {should_not be_valid}
  end

  describe "validates presence of size" do
    subject {FactoryGirl.build(:product, :size => "")}
    it {should_not be_valid}
  end

  describe "validates presence of photo" do
    subject {FactoryGirl.build(:product, :photo => "")}
    it {should_not be_valid}
  end
  
  describe "photo attachment content type validations" do
    subject {FactoryGirl.build(:product, :photo => (File.new(Rails.root.join('spec', 'models', 'product_spec.rb')) ))}
    it {should_not be_valid}
  end

  describe "photo attachment size" do
    subject {FactoryGirl.build(:product, :photo => (File.new(Rails.root.join('test','fixtures','IMG_5464.JPG'))))}
    it {should_not be_valid}
  end
end


