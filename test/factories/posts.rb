FactoryBot.define do
  factory :post, class: Spina::Post do
    title "Test Post"
    author
    body "This is the body of the post."
  end
end 