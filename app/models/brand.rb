class Brand < ActiveRecord::Base
  has_many :products, dependent: :destroy
  belongs_to :look
end
