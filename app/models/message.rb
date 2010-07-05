class Message < ActiveRecord::Base
	validates_presence_of :name, :message => '* Cannot be blank'
	validates_presence_of :email, :message => '* Cannot be blank'
	validates_presence_of :message, :message => '* Cannot be blank'
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => '* Email is in incorrect format'
	
	default_scope :order => "created_at DESC"

	def after_create
		Notifier.deliver_contact_form_notification(self)
	end
end

