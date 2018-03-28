class AddTaggableRelation < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_posts_tags, id: false do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
    end
    add_index :spina_posts_tags, [:post_id, :tag_id]
  end
end
