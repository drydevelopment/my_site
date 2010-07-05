class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :meta_title, :string
      t.column :meta_description, :string
      t.column :meta_keywords, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
