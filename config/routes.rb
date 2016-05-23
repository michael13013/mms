Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :contacts, only: :create
  root to: 'pages#home'
  resources :looks
  resources :products

  get "contact", to: "pages#contact"
  get "qui-sommes-nous", to: "pages#nous"
  get "boutique", to: "pages#boutique"
  get "partenaires", to: "pages#partenaires"
  get "faq", to: "pages#faq"
  get "mentionslegales", to: "pages#mentionslegales"
end
