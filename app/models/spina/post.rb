class Spina::Post < ApplicationRecord
  belongs_to :author, class_name: 'Spina::Account', foreign_key: 'author_id'
end
