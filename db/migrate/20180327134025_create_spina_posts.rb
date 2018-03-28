class CreateSpinaPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_posts do |t|
      t.string :title
      t.references :author, foreign_key: { to_table: :spina_users }
      t.text :body
      t.datetime :published_at
      t.boolean :is_draft

      t.timestamps
    end
  end
end
