Rails.application.routes.draw do
  get 'home/profile'
  root 'home#index'
  devise_for :users
  get 'articles/index'
  get 'proofreadings', to: 'home#proofreadings'
  get 'profile', to: 'home#profile'

  post 'field_professors', to: 'events#field_professors'

  resources :keywords, except: :show
  resources :events do
    resources :articles, except: :index do
      get 'assign', action: 'assign_revisor'
      get 'apply'
    end
  end
end
