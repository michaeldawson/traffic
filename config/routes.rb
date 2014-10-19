Rails.application.routes.draw do
  resources :routes

  devise_for :users, :controllers => { :omniauth_callbacks => "devise/custom/omniauth_callbacks" }
  resources :issues do
    get 'clear', on: :collection
  end

  root to: 'static#index'

  get 'welcome' => 'static#welcome', as: :welcome
  get 'static/tweets'
end
