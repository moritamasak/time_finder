FactoryBot.define do
  factory :status do
    name {'休憩中'}
    description { 'お昼休みのため' }
    association :user, factory: :user
  end
end