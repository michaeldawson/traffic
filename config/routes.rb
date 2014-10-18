Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "devise/custom/omniauth_callbacks" }
  get 'issues' => 'issues#index'

  get 'static/index'
  get 'static/tweets'
end
