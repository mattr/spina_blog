class AddBlogIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_posts, :namespace, :string, index: true
  end
end
