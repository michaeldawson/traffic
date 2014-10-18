Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "devise/custom/omniauth_callbacks" }
  get 'issues' => 'issues#index'

  root to: 'static#index'

  get 'welcome' => 'static#welcome', as: :welcome
  get 'static/tweets'
end
