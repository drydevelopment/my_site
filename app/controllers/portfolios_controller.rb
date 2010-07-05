class PortfoliosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  # GET /portfolios
  # GET /portfolios.xml
  def index
    @page_title = 'Work'
    @featured_portfolios = Portfolio.find_featured
    @not_featured_portfolios = Portfolio.find_not_featured

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.xml
  def show
    @portfolio = Portfolio.find(params[:id])
    @page_title = @portfolio.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.xml
  def new
    @portfolio = Portfolio.new
    @page_title = 'New - '

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(params[:id])
    @page_title = 'Edit - ' + @portfolio.name
  end

  # POST /portfolios
  # POST /portfolios.xml
  def create
    @portfolio = Portfolio.new(params[:portfolio])

    respond_to do |format|
      if @portfolio.save
        params[:portfolio_picture][:portfolio_id] = @portfolio.id
        @portfolio_picture = PortfolioPicture.new(params[:portfolio_picture])
        if @portfolio_picture.save       
          flash[:notice] = 'Portfolio was successfully created.'
          format.html { redirect_to(@portfolio) }
          format.xml  { render :xml => @portfolio, :status => :created, :location => @portfolio }
        else
          flash[:warning] = 'Portfolio picture was NOT created.'
          format.html { render :action => "new" }
          format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
        end
      else
        flash[:warning] = 'Portfolio was NOT created.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.xml
  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        flash[:notice] = 'Portfolio was successfully updated.'
        format.html { redirect_to(@portfolio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.xml
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to(portfolios_url) }
      format.xml  { head :ok }
    end
  end
end
