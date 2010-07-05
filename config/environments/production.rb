# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false
config.action_mailer.delivery_method = :test

Paperclip.options[:command_path] = '/usr/bin'
