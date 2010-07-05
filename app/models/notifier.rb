class Notifier < ActionMailer::Base
  def contact_form_notification(contact)
    recipients "doug@drydevelopment.com"
    from       contact.email
    subject    "New Contact Form Submission: " + contact.name
    body       contact.message
  end
end
