class RenameContactsToMessages < ActiveRecord::Migration
  def self.up
  	rename_table :contacts, :messages
  end

  def self.down
  	rename_table :messages, :contacts
  end
end
