Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  #devise_for :admins,skip: [:passwords, :registrations], controllers:{
    #sessions: "admin/sessions"
  #}

  # devise_for :admins, skip: :all
  # devise_scope :admin do
  #   get 'admin/sign_in' => 'admin/sessions#new'
  #   post 'admin/sign_in' => 'admin/sessions#create'
  #   delete 'admin/sign_out' => 'admin/sessions#destroy'
  # end

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
    }


 namespace :admin do
    get 'top' => 'homes#top'
    resources :genres, only: [:create, :edit, :update, :index]
    resources :products, only: [:create, :edit, :update, :index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
