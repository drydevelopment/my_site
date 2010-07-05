class PortfolioPicture < ActiveRecord::Base
  has_one :portfolio
  has_attached_file :image, 
                    :styles => { :medium => "535x428>",
                                 :thumb => "200x160>",
                                 :featured => '100x100#' }
  
                  
  # validates_as_attachment
  
  protected
  
end
