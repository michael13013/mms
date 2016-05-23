class Feed < ActiveRecord::Base
  has_many :imports, dependent: :destroy
  enum type: [:csv, :xml ]
end
