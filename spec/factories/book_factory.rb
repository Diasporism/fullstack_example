FactoryBot.define do
  factory :book do
    title  { Faker::Book.title }
    genre  { Faker::Book.genre }
    author { Faker::Book.author }
  end
end
