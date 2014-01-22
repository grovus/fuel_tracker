FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :vehicle do
  	make "Test Make"
  	model "Test Model"
  	name "Test Name"
  	year 1970
  	user
  end
end