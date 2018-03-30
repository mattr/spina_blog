FactoryBot.define do
  factory :account, class: Spina::Account do
    name 'My Website'
    preferences { { theme: 'awesome' } }
  end
end