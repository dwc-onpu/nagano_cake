Rails.application.routes.draw do

  devise_for :admin, skip: :all
   devise_scope :admin do
     get "/admin/sign_in", to: "admin/sessions#new",as: :new_admin_session
     post "/admin/sign_in", to: "admin/sessions#create",as: :admin_session
     delete "/admin/sign_out", to: "admin/sessions#destroy",as: :destroy_admin_session
   end
  devise_for :customers, skip: :all
   devise_scope :customer do
    get '/customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post '/customers', to: 'public/registrations#create', as: :customer_registration
    get "/customers/sign_in", to: "public/sessions#new", as: :new_customer_session
    post "/customers/sign_in", to: "public/sessions#create",as: :customer_session
    delete "/customers/sign_out", to: "public/sessions#destroy",as: :destroy_customer_session
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
      root :to => "homes#top"
      get "/about" => "homes#about"
      resources :items,only:[:index,:show]
      delete "/cart_items/destroy_all" => "cart_items#destroy_all"
      resources :cart_items,only:[:index,:update,:create,:destroy]
      resource :customers,only:[:edit,:update,]
      get "/customers/mypage" => "customers#show"
      get "/customers/unsubscribe" => "customers#unsubscribe"
      patch "/customers/withdraw" => "customers#withdraw"
      resources :addresses,only:[:index,:edit,:create,:update,:destroy]
      post "/orders/confirm" => "orders#confirm"
      get "/orders/confirm" => "orders#confirm"
      get "orders/complete" => "orders#complete"
      resources :orders,only:[:new,:create,:index,:show]
  end

  namespace :admin do
      root :to => "homes#top"
      resources :items,only:[:index,:show,:new,:create,:edit,:update]
      resources :genres,only:[:index,:create,:edit,:update]
      resources :customers,only:[:index,:show,:edit,:update]
      resources :orders,only:[:show,:update] do
        resources :order_details,only:[:update]
      end
  end


end
