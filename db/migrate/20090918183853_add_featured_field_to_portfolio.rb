class AddFeaturedFieldToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :is_featured, :tinyint, :default => 0
  end

  def self.down
    remove_column :portfolios, :is_featured
  end
end
