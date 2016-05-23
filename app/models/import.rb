class Import < ActiveRecord::Base
  belongs_to :feed
  enum status: [:success, :pending, :error]
end
