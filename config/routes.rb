WomenOfWaze::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  

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
