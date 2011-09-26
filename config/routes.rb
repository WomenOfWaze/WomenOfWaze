WomenOfWaze::Application.routes.draw do
  resources :products do
    collection do
      get 'catalogue'
    end
  end

  resources :sub_categories

  resources :categories

  #  root :to => "categories#index"

  root :to => 'home#index'
end
