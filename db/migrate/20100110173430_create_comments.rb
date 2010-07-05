class CreateComments < ActiveRecord::Migration
  def self.up
      create_table :comments do |t|
      t.integer :post_id, :null => false
      t.integer :user_id
      t.string :title, :limit => 50, :default => "" 
      t.text :comment, :default => "" 
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
