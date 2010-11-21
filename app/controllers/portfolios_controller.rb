class PortfoliosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @page_title = 'Work'
    @featured_portfolios = Portfolio.featured.all
    @not_featured_portfolios = Portfolio.not_featured.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @page_title = @portfolio.name
  end

  def new
    @portfolio = Portfolio.new
    @page_title = 'New - '
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @page_title = 'Edit - ' + @portfolio.name
  end

  def create
    @portfolio = Portfolio.new(params[:portfolio])
		# TODO accept nested attributes for

		if @portfolio.save
			params[:portfolio_picture][:portfolio_id] = @portfolio.id
			@portfolio_picture = PortfolioPicture.new(params[:portfolio_picture])
			if @portfolio_picture.save       
				flash[:notice] = 'Portfolio was successfully created.'
				redirect_to(@portfolio)
			else
				flash[:warning] = 'Portfolio picture was NOT created.'
				render :action => "new"
			end
		else
			flash[:warning] = 'Portfolio was NOT created.'
			render :action => "new"
		end
  end

  def update
    @portfolio = Portfolio.find(params[:id])

		if @portfolio.update_attributes(params[:portfolio])
			flash[:notice] = 'Portfolio was successfully updated.'
			redirect_to(@portfolio)
		else
			render :action => "edit"
		end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to(portfolios_url)
  end
end
