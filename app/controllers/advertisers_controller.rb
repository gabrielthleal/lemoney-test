# frozen_string_literal: true

#
# app/controllers/advertisers_controller.rb
#
class AdvertisersController < ApplicationController
  # GET advertiser/offer/:id
  def offer
    @offer = Offer.find(params[:id])
  end
end
