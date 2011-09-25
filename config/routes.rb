WomenOfWaze::Application.routes.draw do
  resources :products

  resources :sub_categories

  resources :categories

#  root :to => "categories#index"

  root :to => 'home#index'
end
