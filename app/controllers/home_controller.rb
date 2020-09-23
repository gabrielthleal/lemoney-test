class HomeController < ApplicationController
  def index
    @offers = Offer.where(state: true).order(premium: :desc)
  end
end
