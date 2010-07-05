class Post < ActiveRecord::Base
  acts_as_taggable
  has_friendly_id :title, :use_slug => true
  has_many :comments
  
  def is_published?
    self[:is_published] == true ? true : false
  end
  
  class << self
    def find_all_posts(limit=0)
      if limit > 0
        self.find(:all, :order => 'created_at DESC', :limit => limit)
      else
        self.find(:all, :order => 'created_at DESC')
      end
    end
    
    def find_all_posts_exclusively(post, limit=0)
      if limit > 0
        self.find(:all, :conditions => "id != #{post.id} AND is_published = 1", :order => 'created_at DESC', :limit => limit)
      else
        self.find(:all, :conditions => "id != #{post.id} AND is_published = 1", :order => 'created_at DESC')
      end
    end
    
    def find_published_posts(limit=0)
      if limit > 0
        self.find(:all, :conditions => 'is_published = 1', :order => 'created_at DESC', :limit => limit)
      else
        self.find(:all, :conditions => 'is_published = 1', :order => 'created_at DESC')
      end
    end
  end
end
