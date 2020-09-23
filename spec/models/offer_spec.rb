require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'advertiser_name must be uniq' do
    offer = Offer.new(advertiser_name: 'Amazon')

    context 'when is valid' do
      it { expect(offer.save).to(eq(true)) }
    end

    context 'when is invalid' do
      offer.save
      it { expect(offer.errors.messages[:advertiser_name][0]).to(eq('has already been taken')) }
    end
  end
end
