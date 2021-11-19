Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[create]
  end
  get "/booking/:id", to: "bookings#confirmation", as: "confirmation"
  get "/dashboard", to: "dashboards#show", as: "dashboard"
  resources :users, only: [] do
    member do
      patch :owner
    end
  end

end
