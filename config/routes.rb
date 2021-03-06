Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'drone#index'
  get '/drones', to: 'drone#index', as: 'drones'
  get '/drone/:id', to: 'drone#show', as: 'drone'
  get '/drone/:id/item_activity', to: 'drone#item_activity', as: :drone_item_activity
  post '/drone/update_activity', to: 'drone#update_activity', as: :drone_update_activity
end
