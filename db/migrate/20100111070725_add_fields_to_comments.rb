class AddFieldsToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
    add_column :comments, :email, :string
    add_column :comments, :website, :string
    remove_column :comments, :title
  end

  def self.down
    remove_column :comments, :name
    remove_column :comments, :email
    remove_column :comments, :website
    add_column :comments, :title, :string
  end
end
