Rails.application.routes.draw do
  resources :links
  resources :tags, only: %i[index show]
  resource :profile, only: %i[show edit update]
  resource :demo, only: :show do
    resources :notifications, only: %i[new create], module: :demo
  end
  resource :session, only: %i[new create destroy]
  resource :registration, only: %i[new create]

  root "pages#landing"
end
