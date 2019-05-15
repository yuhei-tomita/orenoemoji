Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/emojis', to: 'emojis#show'
  get  '/emojis/index',  to: 'emojis#index'
  post '/emojis/create', to: 'emojis#create'

  resources :emojis do
    collection do
      get 'search'
    end
  end
end
