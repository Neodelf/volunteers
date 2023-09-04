Rails.application.routes.draw do
  # resources :volunteers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  scope module: :web do
    resources :volunteers, only: %i[create new] do
      collection do
        get :success
      end
    end
  end
end
