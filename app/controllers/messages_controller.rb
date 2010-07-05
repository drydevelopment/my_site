class MessagesController < ApplicationController
  before_filter :login_required, :except => [:index, :new, :create, :thank_you]
  
  def index
    @message = Message.new(params[:contact])
    @page_title = 'Contact'
	render :action => "new"	
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new(params[:contact])
    @page_title = 'Contact'
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = 'Your message was successfully sent.'
      render :action => "thank_you"
	else
      render :action => "new"
    end
  end

  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(params[:message])
      flash[:notice] = 'Contact was successfully updated.'
      redirect_to @message
    else
      render :action => "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    
    redirect_to messages_url
  end
  
  def thank_you
    @page_title = 'Thank You - Contact'
  end
end
