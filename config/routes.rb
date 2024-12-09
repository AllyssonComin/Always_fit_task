Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks do
    member do
      patch :mark_as_completed
    end
    collection do
      get :my_task
    end
  end
end
