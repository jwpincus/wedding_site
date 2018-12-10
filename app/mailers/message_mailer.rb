class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.send_message.subject
  #
  def send_message(message, recipient)
    @name = recipient.all_names

    @body = message.body
    @email = recipient.email


    mail to: recipient.email , subject: message.subject, from: 'Cayley and Jack <Invites@invites.cayleyandjack.com>'
  end
end
