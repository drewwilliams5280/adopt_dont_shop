Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pets#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  patch '/shelters', to: 'shelters#index'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/pets', to: 'pets#index'
  patch '/pets', to: 'pets#index'
  get 'pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  get '/pets/:id/delete', to: 'pets#destroy'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/shelters/:id/pets', to: 'shelterpets#index'
  patch '/shelters/:id/pets', to: 'shelterpets#index'
  get '/shelters/:id/review', to:'shelters#review'
  post '/shelters/:id/review', to: 'shelters#reviewcreate'
  get '/shelters/:id/:review_id/edit', to: 'shelters#reviewedit'
  patch '/shelters/:id/:review_id', to: 'shelters#reviewupdate'
  get "/favorites", to: "favorites#index"
end
