Rails.application.routes.draw do
  get 'categories_emojis/create'
  get 'categories_emojis/destroy'
  root 'emojis#index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/emojis', to: 'emojis#index'
  get  '/emojis/new', to: 'emojis#new'
  get  '/emojis/index',  to: 'emojis#index'
  post '/emojis/create', to: 'emojis#create'

  resources :categories do
    resource :categories_emojis, only: [:create, :destroy]
  end

  resources :categories do
    collection do
      get 'search'
    end
  end

  resources :emojis do
    collection do
      get 'search'
    end
  end

  get '/emojis/:id' , to: 'emojis#show'
  get   '/emojis/:id/edit' ,to: 'emojis#edit'
  post '/emojis/:id/update', to:'emojis#update'

  get  '/categories/:id' , to: 'categories#show'
  get  '/categories/new', to: 'categories#new'
  post '/categories/create', to: 'categories#create'
  get  '/categories/:id', to: 'categories#show'
  get  '/categories/index', to: 'categories#index'


end
