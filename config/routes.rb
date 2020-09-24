Rails.application.routes.draw do
  root 'home#index'
  get 'advertisers/offer/:id', to: 'advertisers#offer'

  resources :offers, path: 'admin/offers' do
    get :state, to: 'offers#change_state'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
