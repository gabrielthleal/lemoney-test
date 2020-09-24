# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'advertisers/offer/:id', to: 'advertisers#offer'

  resources :offers, path: 'admin/offers' do
    get :state, to: 'offers#change_state'
  end
end
