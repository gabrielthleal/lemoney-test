require 'rails_helper'

RSpec.describe Offer, type: :model do
  it { is_expected.to(validate_presence_of(:advertiser_name)) }
  it { is_expected.to(validate_presence_of(:description)) }
  it { is_expected.to(validate_presence_of(:url)) }
  it { is_expected.to(validate_presence_of(:starts_at)) }

  describe 'advertiser_name must be uniq' do
    before(:all) { create(:offer, advertiser_name: 'Amazon') }

    context 'when is valid' do
      it { expect(Offer.all.size).to(eq(1)) }
    end

    context 'when is invalid' do
      it { expect(build(:offer, advertiser_name: 'Amazon').save).to(eq(false)) }
    end
  end
end
