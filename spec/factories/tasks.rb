FactoryGirl.define do
  factory :task do
    user_id { User.ids.sample}
    description { "dafsdasfas#{rand(100)}"}
    status { User.statuses[:start]}
    import { [true,false].sample }
    urgent { [true,false].sample }
  end
end
