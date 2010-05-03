class CreateBar < ActiveRecord::Migration
  def self.up
    create_table :bar do |t|
      t.integer :cash, :default => 0
    end
    Bar.create(:cash => 0)
  end

  def self.down
    drop_table :bar
  end
end
