FactoryBot.define do
  factory :reply do
    user
    response
    sequence(:content) { 'test' }
  end
end
