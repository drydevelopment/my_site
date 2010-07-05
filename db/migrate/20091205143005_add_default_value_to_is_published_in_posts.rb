class AddDefaultValueToIsPublishedInPosts < ActiveRecord::Migration
  def self.up
    change_column :posts, :is_published, :boolean, :default => 0
  end

  def self.down
    change_column :posts, :is_published, :boolean
  end
end
