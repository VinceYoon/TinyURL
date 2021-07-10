Rails.application.routes.draw do
  root to: 'home#index'

  post '/links' => 'links#create'
  get '/:token' => 'links#show'
  get '/:token/info' => 'links#info'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
