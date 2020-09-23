class Offer < ApplicationRecord
  validates_uniqueness_of :advertiser_name
  validates_length_of :description, maximum: 500

  validate :check_dates

  def set_state
    return self.state = true if ends_at.blank?

    return self.state = true if Time.current >= starts_at && Time.current <= ends_at

    self.state = false
  end

  private

  def check_dates
    return if ends_at.blank?

    errors.add(:ends_at, 'cannot be less than starts_at') if ends_at < starts_at
  end
end
