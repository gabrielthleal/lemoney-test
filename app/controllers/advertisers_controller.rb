class AdvertisersController < ApplicationController
  def offer
    @offer = Offer.find(params[:id])
  end
end
