Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :users do
      collection do
        get 'new', to:"users#new"
        post 'new', to:"users#create"
        get "index", to:"users#index"
        get ":id/edit", to:"users#edit"
        post ":id/edit", to:"users#update"
        get ":id/delete", to:"users#destroy"
        get ":id/show", to: "users#show"
        get "show", to: "users#show"
      end
    end
    resources :locations do
      collection do
        get "new", to:"locations#new"
        post "new", to:"locations#create"
        get "index", to:"locations#index"
        get ":id/edit", to:"locations#edit"
        post ":id/edit", to:"locations#update"
        get ":id/delete", to:"locations#destroy"
        get ":id/show", to:"locations#show"
        get "/", to:"locations#index"
      end
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
