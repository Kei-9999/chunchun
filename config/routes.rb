Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
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

 get "users/check" => "users#check"
# scope module: :users do
resources :users do
 get 'relationships/follow' => "relationships#follow", as: "relationship_follow"
 get 'relationships/follower' => "relationships#follower", as: "relationship_follower"
  resource :relationships
 # end
end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'posts/search', to: 'posts#search'
resources :posts do
 resources :comments, only: [:create, :destroy]
end


resource :likes, only: [:create, :destroy]

resource :kawaii, only: [:create]

 
namespace :admins do
 get "top" => "admin/users#index"
  resources :users,only: [:index,:show,:edit,:destroy]
  resources :posts,only: [:index,:show,:edit,:destroy]
  resources :post_comment,only: [:destroy]


end

Rails.application.routes.draw do
  root  'inquiry#index'
  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
end

  get 'home/about' => 'homes#about'
  
  get '/search', to: 'users#search'

  
  
end

