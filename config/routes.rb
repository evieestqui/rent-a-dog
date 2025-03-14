Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dogs, only: [:index, :show] do
    resources :bookings, only: [:create, :show]  # Added :show for confirmation
  end

  resources :bookings, only: [:index] do  # Allows users to see their bookings
    member do
      patch :accept
      patch :decline
    end
  end

  get '/dashboard', to: 'pages#dashboard', as: :dashboard
end
