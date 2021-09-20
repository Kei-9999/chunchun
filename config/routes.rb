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
 # end
end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts do
 resources :comments, only: [:create, :destroy]
end

get "users/check" => "clients#check"

resource :likes, only: [:create, :destroy]

resource :kawaii, only: [:create]

 namespace :admins do

    get "top" => "admin/users#index"

    resources :users,only: [:index,:show,:edit,:destroy]
    resources :posts,only: [:index,:show,:edit,:destroy]

    # get '/search', to: 'searches#search'

end



end

