FactoryBot.define do
  factory :post do
    user
    sequence(:title) { 'test' }
    sequence(:question) { 'test' }
    sequence(:answer) { 'test' }
    sequence(:content) { 'test' }
    sequence(:supplement) { 'test' }
    after(:build) do |post|
      unit = Unit.find(1)
      post.units << unit
    end
  end
end
