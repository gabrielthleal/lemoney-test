require 'rails_helper'

RSpec.describe Offer, type: :model do
  it { is_expected.to(validate_presence_of(:advertiser_name)) }
  it { is_expected.to(validate_presence_of(:description)) }
  it { is_expected.to(validate_presence_of(:url)) }
  it { is_expected.to(validate_presence_of(:starts_at)) }

  describe 'advertiser_name must be uniq' do
    context 'when is valid' do
      let(:offer) { build(:offer) }

      it { expect(offer.save).to(eq(true)) }
    end

    context 'when is invalid' do
      before { create(:offer, advertiser_name: 'walmart') }
      let(:invalid_offer) { build(:offer, advertiser_name: 'walmart') }

      it do
        invalid_offer.save

        expect(invalid_offer.errors.messages[:advertiser_name][0]).to(eq('has already been taken'))
      end
    end
  end

  describe '#check_url' do
    context 'when is a valid url' do
      let(:offer) { build(:offer, url: 'http://example.com') }

      it { expect(offer.save).to(be(true)) }
    end

    context 'when is a invalid url' do
      let(:offer) { build(:offer, url: 'invalid') }

      it do
        offer.save
        expect(offer.errors.messages[:url][0]).to(eq('must be a valid one'))
      end
    end
  end

  describe '#check_dates' do
    context 'when is a valid date' do 
      let(:offer) { build(:offer, starts_at: Time.current - 1.day, ends_at: Time.current + 3.days) }

      it { expect(offer.save).to(eq(true)) }
    end

    context 'when ends_at is less than starts_at' do
      let(:offer) { build(:offer, starts_at: Time.current, ends_at: Time.current - 3.days) }

      it do
        offer.save
        expect(offer.errors.messages[:ends_at][0]).to(eq('cannot be less than starts_at'))
      end
    end
  end
end
