Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Administration
  namespace :admin do
    resources :users do
      post 'punch'
      get 'users', to: "users#index"
    end
  end

  # Show events
  resources :events do
    post 'punch'
    get "events", to: "events#index"
  end


  #Default page
  root "events#index"
end
