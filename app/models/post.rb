class Post < ActiveRecord::Base
  acts_as_taggable
  has_friendly_id :title, :use_slug => true
  has_many :comments
  
  default_scope :order => 'created_at DESC'
  named_scope :published, lambda { |limit| { :conditions => "is_published = 1", :limit => limit } }
  named_scope :exclusive, lambda { |post, limit| { :conditions => "is_published = 1 AND id != #{post.id}", :limit => limit } }
  
  def is_published?
    self[:is_published] || false
  end
end
