Rails.application.routes.draw do
  get 'notifications', to: 'notifications#show'
  get 'home/profile'
  get 'profile/articles', to: 'articles#index'
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
    resources :articles, except: :index
    patch 'articles/:id/assign', to: 'articles#assign', as: 'article_assign'
    patch 'articles/:id/apply', to: 'articles#apply', as: 'article_apply'
  end
end
