# frozen_string_literal: true

#
# app/controllers/offers_controller.rb
#
class OffersController < ApplicationController
  before_action :set_offer, only: %i[update edit destroy]

  # GET /admin/offers
  def index
    @offers = Offer.all.order(id: :asc)
  end

  # GET /admin/offers/new
  def new
    @offer = Offer.new
  end

  # GET /admin/offers/:id/edit
  def edit; end

  # POST admin/offers
  def create
    @offer = Offer.new(offer_params)
    @offer.set_state

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_path, notice: 'Offer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT admin/offers/:id
  def update
    @offer.set_state
    
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offers_path, notice: 'Offer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE admin/offers/:id
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
    end
  end

  # GET admin/state/:offer_id
  def change_state
    offer = Offer.find(params[:offer_id])

    offer.state = !offer.state
    offer.save

    respond_to do |format|
      format.html { redirect_to offers_url }
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
  end
end
