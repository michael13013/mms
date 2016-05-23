class Offer < ActiveRecord::Base
  belongs_to :product

  validates :price, presence: true
  validates :product, presence: true
  validates :supplier, presence: true

include PgSearch

  pg_search_scope :search_engine_size, against: [ :size ]

end
