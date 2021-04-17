Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  devise_for :admin,controllers:{
      sessions: "admin/sessions",
      passwords: "admin/passwords",
      registrations: "admin/registrations"
  }
  devise_for :customers, controllers:{
      sessions: "public/sessions",
      passwords: "public/passwords",
      registrations: "public/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
      root :to => "homes#top"
      get "/about" => "homes#about"
      resources :items,only:[:index,:show]
      resources :cart_items,only:[:index,:update,:create,:destroy]
      delete "/cart_items/destroy_all" => "cart_items#destroy_all"
      resource :customers,only:[:edit,:update,]
      get "/customers/mypage" => "customers#show"
      get "/customers/unsubscribe" => "customers#unsbscribe"
      patch "/customers/withdraw" => "customers#withdraw"
      resources :addresses,only:[:index,:edit,:create,:update,:destroy]
      resources :orders,only:[:new,:create,:index,:show]
      post "/orders/confirm" => "orders#confirm"
      get "/orders/complete" => "orders#complete"
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
