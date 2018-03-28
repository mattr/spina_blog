class AddTagsToPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :taggable do |t|
    end
  end
end
