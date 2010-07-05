ActionController::Routing::Routes.draw do |map|
  map.resources :about
  map.resources :posts, :as => 'blog', :member => { :add_comment => :post }
  
  map.resources :messages, :as => :contact, :collection => { :thank_you => :get }
  map.resources :users
  map.resource :session
  map.resources :portfolio_pictures
  map.resources :portfolios, :as => 'work'
  
  # map.contact '/contact', :controller => :messages, :action => 'new'
  # map.connect 'contact/thank-you', :controller => :messages, :action => 'thank_you'

  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
