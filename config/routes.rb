Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users do
      collection do
        get 'new', to: "users#new"
        post 'new', to: "users#create"
        get "index", to: "users#index"
        get ":id/edit", to: "users#edit"
        post ":id/edit", to: "users#update"
        get ":id/delete", to: "users#destroy"
        get ":id/show", to: "users#show"
        get "show", to: "users#show"
      end
    end
    resources :locations do

      collection do
        get "index", to: "locations#index"
        get ":id/edit", to: "locations#edit"
        get "new", to: "locations#new"
        post "new", to: "locations#create"
        post ":id/edit", to: "locations#update"
        get ":id/delete", to: "locations#destroy"
        get ":id/show", to: "locations#show"
        get "/", to: "locations#index"
      end
    end

    resources :dashboards do
      collection do
        get "index", to: "dashboards#index"
        get "/", to: "dashboards#index"
      end
    end
    resources :events do
      collection do
        get "index", to: "events#index"
        get ":id/edit", to: "events#edit"
        post ":id/edit", to: "events#update"
        get "new", to: "events#new"
        post "new", to: "events#create"
        get ":id/delete", to: "events#destroy"
        get ":id/show", to: "events#show"
        get "/", to: "events#index"
      end
    end
    get "/", to:"dashboards#index"
  end


  # Show events
  resources :events do
    post 'punch'
    get "events", to: "events#index"
  end


  #Default page
  root "events#index"
end
