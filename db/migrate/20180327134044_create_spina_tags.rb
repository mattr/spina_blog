class CreateSpinaTags < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
