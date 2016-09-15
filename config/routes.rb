Rails.application.routes.draw do
  resources :products do
    resources :comments
  end
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'

  get 'static_pages/contact'

  post 'payments/create'

  get '/products/:id', to: 'products#show'

  post 'static_pages/thank_you'

  # get 'static_pages/index'
  root 'products#landing_page'
  match '/search_suggestions', to: 'products#index', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'},
    :controllers => { :registrations => "user_registrations" }
end
