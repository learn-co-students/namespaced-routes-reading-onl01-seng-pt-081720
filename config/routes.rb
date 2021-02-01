Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index'   #preferred for only admin to manage stats
  
  # get '/stats', to: 'stats#index'
  #too mess so make it into a scope
  
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  namespace :admin do
  # scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end
  root 'posts#index'
end
