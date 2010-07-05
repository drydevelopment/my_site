class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :post_id
  validates_presence_of :comment
  validates_presence_of :name, :if => proc { |obj| obj.user_id.blank? }
  validates_presence_of :email, :if => proc { |obj| obj.user_id.blank? }
  
  def website
    self[:website] unless self[:website] == ""
  end
end
