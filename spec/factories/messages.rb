FactoryBot.define do
  factory :message do
    body { 'Hello, this is a test message.' }
    association :conversation
    association :user
  end
end
