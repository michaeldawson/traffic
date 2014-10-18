Rails.application.routes.draw do
  get 'issues' => 'issues#index'

  get 'static/index'
  get 'static/tweets'
end
