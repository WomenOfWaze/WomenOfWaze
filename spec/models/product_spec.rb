require 'spec_helper'

describe Product do
  subject { FactoryGirl.create :product }
  its(:name) { should_not be_nil }
end
