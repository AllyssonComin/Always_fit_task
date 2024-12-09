Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks do
    member do
      patch :mark_as_completed
    end
  end
end
