class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new
  end

  def nous
  end

  def partenaires
    @contact = Contact.new
  end

  def faq
    @contact = Contact.new
  end

  def mentionslegales
  end

end
