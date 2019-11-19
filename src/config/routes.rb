Rails.application.routes.draw do
  get 'notifications', to: 'notifications#show'
  get 'home/profile'
  root 'home#index'
  devise_for :users
  get 'articles/index'
  get 'proofreadings', to: 'home#proofreadings'
  get 'profile', to: 'home#profile'

  post 'field_professors', to: 'events#field_professors'

  resources :users, only: :index do
    get 'profile'
  end

  resources :keywords, except: :show
  resources :fields, except: :show
  resources :events do
    resources :articles, except: :index do
      get 'assign'
      get 'apply'
    end
  end
end
