class AddIsApprovedToComments < ActiveRecord::Migration
  def self.up
  	add_column :comments, :is_approved, :boolean, :null => false, :default => true
  end

  def self.down
  	remove_column :comments, :is_approved
  end
end
