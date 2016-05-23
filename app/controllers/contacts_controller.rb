class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_param)
    @contact.save
    ContactMailer.contact(@contact).deliver_now
    redirect_to root_path, notice: 'Nous avons bien reçu votre demande de contact.'
  end

  private
  def contact_param
    params.require(:contact).permit(:name, :subject, :email, :message)
  end
end
