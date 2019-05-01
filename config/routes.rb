Rails.application.routes.draw do
  devise_for :users do

  end
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
        get "costumer", to: "users#costumer"
        get "employer", to: "users#employer"
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
    resources :tickets do
      collection do
        get "index", to: "tickets#index"
        get ":id/edit", to: "tickets#edit"
        post ":id/edit", to: "tickets#update"
        get "new", to: "tickets#new"
        post "new", to: "tickets#update"
        get ":id/delete", to: "tickets#destroy"
        #get ":id/show", to: "tickets#show"
        get "/", to: "tickets#index"
      end
    end

    resources :performances do
      collection do
        get "index", to: "performances#index"
        get ":id/edit", to: "performances#edit"
        post ":id/edit", to: "performances#update"
        get "new", to: "performances#new"
        post "new", to: "performances#create"
        get ":id/delete", to: "performances#destroy"
        get ":id/show", to: "performances#show"
        get "/", to: "performances#index"
      end
    end

    resources :settings, :except => [:show]
    resources :api_clients, :only => [:index,
                                      :new,
                                      :create,
                                      :edit,
                                      :update,
                                      :destroy]
    get "/", to: "dashboards#index"
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :events, except: [:get] do
        collection do
          post "get"
        end
      end
      resources :tickets, except: [:validate_ticket] do
        collection do
          post "validate_ticket"
        end
      end
      resources :users, :except => [:signIn] do
        collection do
          post "signIn"
        end
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
