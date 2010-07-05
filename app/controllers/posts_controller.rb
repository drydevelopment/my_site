class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :tag, :add_comment]
  
  def index
    @page_title = 'Recent Blog Posts'
    if logged_in?
      @posts = Post.find_all_posts()
    else
      @posts = Post.find_published_posts()
    end
    @tags = Tag.find(:all, :order => 'name ASC') # Tags Module

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
	@comment = Comment.new
    if !@post.is_published? and !logged_in?
      render_missing_page
    else
      redirect_to @post, :status => 301 if @post.has_better_id?
      @page_title = @post.title
      @meta_description = @post.meta_description
      @meta_keywords = @post.meta_keywords
      @other_posts = Post.find_all_posts_exclusively(@post) # Other Posts Module
      @tags = Tag.find(:all, :order => 'name ASC') # Tags Module
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @post }
      end
    end
  end
  
  def tag
    if !params[:id]
      render_missing_page
    else
      @tag_name = params[:id]
      @page_title = @tag_name + ' - Tag'
      @posts = Post.find_tagged_with(@tag_name, :order => 'created_at DESC')
      @tags = Tag.find(:all, :order => 'name ASC') # Tags Module
    
      respond_to do |format|
        format.html #tag.html.erb
      end
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_comment
    @post = Post.find(params[:id])
    @comment = Comment.new(params[:comment])
	if @comment.save
		redirect_to @post
	else
		@page_title = @post.title
		@meta_description = @post.meta_description
		@meta_keywords = @post.meta_keywords
		@other_posts = Post.find_all_posts_exclusively(@post) # Other Posts Module
		@tags = Tag.find(:all, :order => 'name ASC') # Tags Module
		render :action => "show", :id => @post
	end 
  end

end
