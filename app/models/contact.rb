class Contact < ActiveRecord::Base
  validates :name ,presence: true
  validates :subject ,presence: true
  validates :email ,presence: true
  validates :message ,presence: true
end
