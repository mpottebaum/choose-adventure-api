Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/stories', to: 'stories#index'
  post '/stories', to: 'stories#create'
  get '/stories/:id', to: 'stories#show'
  put '/stories/:id', to: 'stories#update'
  delete '/stories/:id', to: 'stories#destroy'

  get '/story-nodes', to: 'story_nodes#index'
  post '/story-nodes', to: 'story_nodes#create'
  get '/story-nodes/:id', to: 'story_nodes#show'
  put '/story-nodes/:id', to: 'story_nodes#update'
  delete '/story-nodes/:id', to: 'story_nodes#destroy'
  put '/story-nodes/:id/move', to: 'story_nodes#move'
  
  get '/choices/:id', to: 'choices#show'
  put '/choices/:id', to: 'choices#update'
  delete '/choices/:id', to: 'choices#destroy'
end
