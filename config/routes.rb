ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :as => 'blog', :member => { :add_comment => :post }
  map.resources :messages, :as => :contact, :collection => { :thank_you => :get }
  map.resources :users
  map.resources :portfolio_pictures
  map.resources :portfolios, :as => 'work'
  
  map.resource :session
  
  map.with_options :controller => 'pages' do |pages|
    pages.about 'about', :action => 'about'    
    pages.root :action => 'home'
  end
  
  map.with_options :controller => 'sessions' do |sessions|
    sessions.login 'login', :action => 'new'
    sessions.logout 'logout', :action => 'destroy'
  end
end
