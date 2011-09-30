WomenOfWaze::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  

  resources :products do
    collection do
      get 'catalogue'
    end
    member do
      get 'detail'
    end
  end

  resources :sub_categories
  resources :categories 
  resources :enquiries

  match "/aboutus" => "home#aboutus"

  #  root :to => "categories#index"

  root :to => 'home#index'

end
