require 'rails_helper'

describe Product do
  before do
    # @product = FactoryGirl.build(:product)
    # @user = FactoryGirl.build(:user)
    @product = FactoryGirl.create(:product)
    @user = FactoryGirl.build(:user, email:"test_user@example.com", password:"123456")

    @product.comments.create(rating: 1.0, user: @user, body: "Awful bike!")
    @product.comments.create(rating: 3.0, user: @user, body: "So so")
    @product.comments.create(rating: 5.0, user: @user, body: "I love this bike :D")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3.0
  end

  it "should be not valid to have only the description" do
    expect(Product.new(description: "awesome bike")).not_to be_valid
  end
end
