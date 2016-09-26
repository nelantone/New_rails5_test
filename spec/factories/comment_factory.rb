FactoryGirl.define do

  # sequence(:name) { |n| "Comment {n}" }

  factory :comment do
    rating 4
  end

  # factory :comment_2 do
  #   rating 3
  #   body 'medium-bad'
  # end

  # factory :comment_3 do
  #   rating 5
  #   body 'ok'
  # end

end
