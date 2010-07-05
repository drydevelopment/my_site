ActionController::Routing::Routes.draw do |map|
  map.resources :about
  map.resources :posts, :as => 'blog', :member => { :add_comment => :post }
  map.resources :contacts
  map.resources :users
  map.resource :session
  map.resources :portfolio_pictures
  map.resources :portfolios, :as => 'work'
  
  map.contact '/contact', :controller => :contacts, :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => "home"

  map.connect 'contact/thank-you', :controller => 'contacts', :action => 'thank_you'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
