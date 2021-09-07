Rails.application.routes.draw do
  root to: 'homes#top'
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
