class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact.contact.subject
  #
  def contact(contact)
    @greeting = "Hi"
    @subject = contact.subject
    @name = contact.name
    @email = contact.email
    @message = contact.message
    mail(
      to:       "contact@monsieur-mode-shop.com",
      from: "contact@monsieur-mode-shop.com",
      subject:  "#{@email} - #{@subject}"
    )
  end

  def welcome
  end

end
