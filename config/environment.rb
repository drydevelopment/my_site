RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION
ENV["RAILS_ENV"] ||= 'development'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session_store = :active_record_store
  
  config.gem 'thoughtbot-paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem "friendly_id"
  config.gem 'ruby-recaptcha'
	config.gem 'mysql'

  config.time_zone = 'UTC'
end
