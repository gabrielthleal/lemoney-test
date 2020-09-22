class Offer < ApplicationRecord
  validates_uniqueness_of :advertiser_name
  validates_length_of :description, maximum: 500
end
