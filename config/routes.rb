Rails.application.routes.draw do

  devise_for :users
  
  root to: 'users#index'  
  get 'public_lists', to: 'lists#public'
  get '/destroy_list', to: 'lists#destroy'
  get '/destroy_task', to: 'tasks#destroy'
  get  '/destroy_bookmark', to: 'bookmarks#destroy'
  get '/users/sign_out', to: 'devise/sessions#destroy'

  authenticate :user do
    resources :lists do 
      resources :tasks, except: [:index] do
      	member do
      		get :complete_task
      	end
      end
    end
    resources :bookmarks
  end

  
end
