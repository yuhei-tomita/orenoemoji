Rails.application.routes.draw do
  root 'emojis#index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/emojis', to: 'emojis#index'
  get  '/emojis/new', to: 'emojis#new'
  get  '/emojis/index',  to: 'emojis#index'
  post '/emojis/create', to: 'emojis#create'

  get '/emojis/:id' , to: 'emojis#show'
  get   '/emojis/:id/edit' ,to: 'emojis#edit'
  post '/emojis/:id/update', to:'emojis#update'
  post '/emojis/:id/destroy', to:'emojis#destroy'

  get  '/categories/new', to: 'categories#new'
  post '/categories/create', to: 'categories#create'
  get  '/categories/:id', to: 'categories#show'
  get  '/categories/index', to: 'categories#index'

  resources :emojis do
    collection do
      get 'search'
    end
  end
end
