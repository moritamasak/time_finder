FactoryBot.define do
  factory :follower do
    association :boss, factory: :user
    association :subordinate, factory: :second_user
  end
end