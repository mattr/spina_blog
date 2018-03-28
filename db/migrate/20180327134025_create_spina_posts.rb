class CreateSpinaPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_posts do |t|
      t.string :title
      t.references :author, foreign_key: true # TODO: Make this reference the spina_accounts table.
      t.text :body
      t.datetime :published_at
      t.boolean :is_draft

      t.timestamps
    end
  end
end
