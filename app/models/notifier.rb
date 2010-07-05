class Notifier < ActionMailer::Base
  def contact_form_notification(contact)
    recipients "doug@drydevelopment.com"
    from       contact.email
    subject    "New Contact Form Submission: " + contact.name
    body       contact.message
  end

  def comment_notification(comment)
	recipients 	"doug@drydevelopment.com"
	from		comment.email
	subject		"Comment for' #{comment.post.title}'"
	body		comment.comment
  end
end
