class AddPortfolioFields < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :name, :string
    add_column :portfolios, :description, :text
    add_column :portfolios, :specs, :text
    add_column :portfolios, :url, :string
  end

  def self.down
    remove_column :portfolios, :name
    remove_column :portfolios, :description
    remove_column :portfolios, :specs
    remove_column :portfolios, :url
  end
end
