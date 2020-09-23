class OffersController < ApplicationController
  before_action :set_offer, only: %i[update edit destroy]

  # Shows all offers
  def index
    @offers = Offer.all.order(id: :asc)
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  def edit; end

  # POST /offers
  # POST /offers.json
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

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
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

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
    end
  end

  def change_state
    offer = Offer.find(params[:offer_id])

    offer.state = !offer.state
    offer.save

    respond_to do |format|
      format.html { redirect_to offers_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
  end
end
