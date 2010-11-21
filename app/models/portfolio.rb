class Portfolio < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_many :portfolio_pictures
	
	validates_presence_of :name, :url, :description, :specs

	default_scope :order => "portfolios.created_at DESC"
	named_scope :featured, :conditions => { :is_featured => true }
	named_scope :not_featured, :conditions => { :is_featured => false }

	def featured?
		self.is_featured?
	end
end
