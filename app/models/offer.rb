# frozen_string_literal: true

#
# app/models/offer.rb
#
class Offer < ApplicationRecord
  validates_uniqueness_of :advertiser_name
  validates_length_of :description, maximum: 500
  validates :advertiser_name, :description, :url, :starts_at, presence: true

  before_save :check_dates, :check_url

  def set_state
    return self.state = true if ends_at.blank?

    return self.state = true if Time.current >= starts_at && Time.current <= ends_at

    self.state = false
  end

  private

  def check_url
    return if url.match?(/\A#{URI::DEFAULT_PARSER.make_regexp}\z/)

    errors.add(:url, 'must be a valid one')
  end

  def check_dates
    return if ends_at.blank?

    errors.add(:ends_at, 'cannot be less than starts_at') if ends_at < starts_at
  end
end
