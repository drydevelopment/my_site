class AddPortfolioIdToPortfolioPictures < ActiveRecord::Migration
  def self.up
    add_column :portfolio_pictures, :portfolio_id, :integer
  end

  def self.down
    remove_column :portfolio_pictures, :portfolio_id
  end
end
