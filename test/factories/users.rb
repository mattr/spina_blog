FactoryBot.define do
  factory :user, class: Spina::User, aliases: [:author] do
    name  'Stephen King'
    email 'sking@example.com'
    password 'password'
    password_confirmation { password }
    admin true
  end
end