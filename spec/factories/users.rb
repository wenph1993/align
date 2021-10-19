FactoryGirl.define do
  factory :user do
    name {"align#{rand(1000)}"}
    password {"Aa#{rand(1000_000)}"}
  end
end
