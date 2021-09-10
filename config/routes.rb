Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
 devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

 
# scope module: :users do
resources :users do
  resources :comments
  # # get 'comments/index'
  # # get 'comments/show'
  # # get 'comments/new'
  # # get 'comments/edit'
  
  # get 'posts/index' => 'posts#index'
  # get 'posts/:id' => 'posts#show'
  # get 'posts/new' => 'posts#new'
  # post "posts/new" => 'posts#create'
  # get 'posts/edit'
  # get 'users/top' => 'users#top'
  # get 'users/index' => 'users#index'
  
end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts


 namespace :admin do

    get "top" => "users#index"

    resources :users,only: [:index,:show,:edit,:destroy]
    resources :posts,only: [:index,:show,:edit,:destroy]
    # resources :clients,only: [:index,:show,:edit,:update]
    # resources :orders,only: [:index,:show,:update]
    # resources :order_items,only: [:update]
    # get '/search', to: 'searches#search'

end



end

