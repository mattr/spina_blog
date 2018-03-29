class AddMaterializedPathToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_posts, :materialized_path, :string, index: :unique
  end
end
