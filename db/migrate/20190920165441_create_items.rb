class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :menu_id

      t.timestamps
    end
  end
end
