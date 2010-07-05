class PortfolioPicturesController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  
  # GET /portfolio_pictures
  # GET /portfolio_pictures.xml
  def index
    @portfolio_pictures = PortfolioPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolio_pictures }
    end
  end

  # GET /portfolio_pictures/1
  # GET /portfolio_pictures/1.xml
  def show
    @portfolio_picture = PortfolioPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @portfolio_picture }
    end
  end

  # GET /portfolio_pictures/new
  # GET /portfolio_pictures/new.xml
  def new
    @portfolio_picture = PortfolioPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio_picture }
    end
  end

  # GET /portfolio_pictures/1/edit
  def edit
    @portfolio_picture = PortfolioPicture.find(params[:id])
  end

  # POST /portfolio_pictures
  # POST /portfolio_pictures.xml
  def create
    @portfolio_picture = PortfolioPicture.new(params[:portfolio_picture])

    respond_to do |format|
      if @portfolio_picture.save
        flash[:notice] = 'PortfolioPicture was successfully created.'
        format.html { redirect_to(:controller => 'portfolios', :action => 'edit', :id => @portfolio_picture.portfolio_id) }
        format.xml  { render :xml => @portfolio_picture, :status => :created, :location => @portfolio_picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portfolio_pictures/1
  # PUT /portfolio_pictures/1.xml
  def update
    @portfolio_picture = PortfolioPicture.find(params[:id])

    respond_to do |format|
      if @portfolio_picture.update_attributes(params[:portfolio_picture])
        flash[:notice] = 'PortfolioPicture was successfully updated.'
        format.html { redirect_to(@portfolio_picture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @portfolio_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_pictures/1
  # DELETE /portfolio_pictures/1.xml
  def destroy
    @portfolio_picture = PortfolioPicture.find(params[:id])
    @portfolio_picture.destroy

    respond_to do |format|
      flash[:notice] = 'Image was successfully deleted.'
      format.html { redirect_to(:controller => 'portfolios', :action => 'edit', :id => @portfolio_picture.portfolio_id) }
      format.xml  { head :ok }
    end
  end
end
