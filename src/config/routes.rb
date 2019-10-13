Rails.application.routes.draw do
  get 'home/profile'
  root 'home#index'
  devise_for :users
  get 'articles/index'
  get 'profile', to: 'home#profile'

  post 'field_professors', to: 'events#field_professors'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :articles, except: :index do
      get 'assign', action: 'assign_revisor'
    end
  end
end
