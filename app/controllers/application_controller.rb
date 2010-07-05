# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "default" # Set default layout

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  # ERROR PAGE HANDLING
  rescue_from ActiveRecord::RecordNotFound, :with => :render_record_not_found

  # Catch record not found for Active Record
  def render_record_not_found
    render :template => "error/404", :status => 404
  end

  # Catches any missing methods and calls the general render_missing_page method
  def method_missing(*args)
    render_missing_page # calls my common 404 rendering method
  end

  # General method to render a 404
  def render_missing_page
    render :template => "error/404", :status => 404
  end
  
  protected
  
  def redirect_back
    redirect_to :back rescue redirect_to root_path
  end
    
end
