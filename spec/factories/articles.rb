FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    status { "public" }
    user
  end
end
