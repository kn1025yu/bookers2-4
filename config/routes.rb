Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  post '/books/new', to: 'books#create', as: :create

end
