class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.send_message.subject
  #
  def send_message(message, recipient)
    if recipient.plus_ones.count > 0
      @name = ([recipient.name] + [recipient.plus_ones.pluck(:name)]).join(", ")
    else 
      @name = recipient.name
    end
    
    @body = message.body
    
    recipients = recipient.all_emails
    
    mail to: recipient.email, subject: message.subject, from: 'Cayley and Jack <Invites@invites.cayleyandjack.com>'
  end
end
