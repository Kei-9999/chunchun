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
 get 'relationships/follow' => "relationships#follow", as: "relationship_follow"
 get 'relationships/follower' => "relationships#follower", as: "relationship_follower"
  resource :relationships
end

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts do
 resources :comments, only: [:create, :destroy]
end

resource :likes, only: [:create, :destroy]

 namespace :admins do

    get "top" => "admin/users#index"

    resources :users,only: [:index,:show,:edit,:destroy]
    resources :posts,only: [:index,:show,:edit,:destroy]
    # resources :clients,only: [:index,:show,:edit,:update]
    # resources :orders,only: [:index,:show,:update]
    # resources :order_items,only: [:update]
    # get '/search', to: 'searches#search'

end



end

