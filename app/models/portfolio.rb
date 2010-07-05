class Portfolio < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_many :portfolio_pictures
  
  class << self
    def find_featured
      self.find(:all, :conditions => "is_featured = 1")
    end
    def find_not_featured
      self.find(:all, :conditions => "is_featured = 0")
    end
  end
end
