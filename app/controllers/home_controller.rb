# frozen_string_literal: true

#
# app/controllers/home_controller.rb
#
class HomeController < ApplicationController
  # GET /
  def index
    @offers = Offer.where(state: true).order(premium: :desc)
  end
end
