class Message < ActiveRecord::Base
	validates_presence_of :name, :email, :message
	validates_format_of :email, 
											:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
											:message => '* Email is in incorrect format',
											:allow_blank => true
	
	default_scope :order => "created_at DESC"

	def after_create
		Notifier.deliver_contact_form_notification(self)
	end
end

