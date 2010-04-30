class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.integer :price
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
