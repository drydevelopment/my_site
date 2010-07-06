class PagesController < ApplicationController
  def about
    @page_title = 'About'
  end
  
  def home
    @portfolios = Portfolio.find(:all, :conditions => { :is_featured => 1 }, :limit => 3)
    @posts = Post.published(5)
  end
end