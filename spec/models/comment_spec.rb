require 'rails_helper'

describe Comment do
  it "should be not valid to have only a rating" do
    expect(FactoryGirl.build(:comment)).not_to be_valid
  end
end