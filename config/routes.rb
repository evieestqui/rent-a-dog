Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # get "/dashboard", to: "pages#dashboard"

  resources :dogs, only: [:index, :show] do
    resources :bookings, only: [:create]
  end


    # resources :bookings, only: [] do
    #   member do
    #     patch :accept
    #     patch :decline
    #   end
    # end
  # end
end
