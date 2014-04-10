EpiPic::Application.routes.draw do
  resources :users
  resources :sessions
  resources :pictures
  resources :tags
  root :to => 'sessions#new'

end
