FactoryBot.define do
  factory :account, class: Spina::Account do
    name 'MySite'
    preferences { { theme: 'demo' } }
  end
end