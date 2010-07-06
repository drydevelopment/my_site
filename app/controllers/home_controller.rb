class HomeController < ApplicationController
  helper [HomeHelper, PostsHelper]
  def index
    @portfolios = Portfolio.find(:all, :conditions => { :is_featured => 1 }, :limit => 3)
    @posts = Post.published(5)
  end

end
