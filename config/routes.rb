Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", confirmations: "users/confirmations", passwords: "users/passwords", unlocks: "users/unlocks"} do

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
    resources :orders do
      collection do
        post ":id/setPaid", to: "orders#setPaid"
        get "index", to: "orders#index"
        post ":id/setUnPaid", to: "orders#setUnPaid"
      end
    end

    resources :settings, :except => [:show, :defaultInfo] do
      collection do
        post "defaultInfo", to: "settings#defaultInfo"
      end
    end
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
      resources :users do
        collection do
          post "signIn"
        end
      end
    end
  end


  # Show events
  namespace :frontend do
    resources :events do
      collection do
        get ":id/show", to: "events#show", :shallow => true
      end
      resources :performances do
        collection do
          get ":id/show", to: "performances#show"
        end
      end
    end
    get ":id/add", to: "carts#add_item", :as => :add_to_cart
    get ":id/remove", to: "carts#remove_item", :as => :remove_from_cart
    post ":id/update", to: "carts#update", :as => :update_cart
    get "cart", to: "carts#list_items"
    post "create_order", to: "carts#order"
    get "checkout", to: "carts#checkout"
    get "success", to: "carts#success"
    get "/", to: "events#index"
    get "list", to: "events#list"

  end

  #Default page
  root "frontend/events#index"
end
