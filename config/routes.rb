WomenOfWaze::Application.routes.draw do
  devise_for :users

  resources :products do
    collection do
      get 'catalogue'
    end
  end

  resources :sub_categories

  resources :categories

  #  root :to => "categories#index"

  root :to => 'home#index'

  devise_for :users
end
