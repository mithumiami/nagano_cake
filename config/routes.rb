Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations:  "customers/registrations",
    sessions:       "customers/sessions",
    passwords:      'customers/passwords'
  }


  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords'
  }


 namespace :admin do
    get 'top' => 'homes#top'
    resources :genres, only: [:create, :edit, :update, :index]
    resources :products, only: [:create, :new, :edit, :update, :index, :show]
    resources :post_images, only: [:new, :create, :index, :show, :destroy]
    resources :customers, only: [:create, :edit, :update, :index, :show]
    resources :orders, only: [:index, :show]
  end

  scope module: :public do
    get 'about' => 'homes#about'
     resources :products, only: [:index, :show]
     resources :customers, only: [:edit, :update, :show]
     resources :deliveries, only: [:index, :edit, :create, :update, :destroy,]
     get '/customers/:id/check' => 'customers#check', as: 'check'         #顧客の退会確認画面
     patch '/customers/:id/goodbye' => 'customers#goodbye', as:'goodbye'    #顧客の退会処理（ステータスの更新）
     resources :cart_items, only: [:index, :update, :destroy, :create]
     delete '/cart_items/:id/delete' => 'cart_items#delete', as: 'delete'


  end


  root to: 'public/homes#top'


  #devise_for :admins,skip: [:passwords, :registrations], controllers:{
    #sessions: "admin/sessions"
  #}

  # devise_for :admins, skip: :all
  # devise_scope :admin do
  #   get 'admin/sign_in' => 'admin/sessions#new'
  #   post 'admin/sign_in' => 'admin/sessions#create'
  #   delete 'admin/sign_out' => 'admin/sessions#destroy'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
