EpiPic::Application.routes.draw do
  resources :users
  resources :sessions
  resources :pictures
  root :to => 'pictures#index'

end
