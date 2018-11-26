Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Administration
  namespace :admin do
    resources :users do
      post 'punsh'
      get 'users', to: "users#index"
    end
  end

end
