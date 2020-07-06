FactoryBot.define do
  factory :response do
    user
    post
    sequence(:content) { 'test' }
  end
end
