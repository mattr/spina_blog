FactoryBot.define do
  factory :post, class: Spina::Post do
    title "Test Post"
    author
    body "This is the body of the post."
    publish_date "2018-07-23"
    publish_time "20:30"
    is_draft false
    namespace 'blog'
  end
end 