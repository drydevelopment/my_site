class AddDefaultUserForDeployment < ActiveRecord::Migration
  def self.up
    User.create :login => 'admin', :email => 'doug@drydevelopment.com', :password => 'drydev_admin'
  end

  def self.down
  end
end
