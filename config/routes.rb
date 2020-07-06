Rails.application.routes.draw do
  devise_for :users
  
  root 'posts#index'
  resources :posts do
    resources :responses, only: [:create]
    resources :likes, only: [:create]
    resources :stocks, only: [:create]
  end

  delete '/posts/:post_id/likes/:like_id' => "likes#destroy", as: "kill_likes"
  delete '/posts/:post_id/stocks/:stock_id' => "stocks#destroy", as: "kill_stocks"
  resources :users, only: [:show, :edit, :update]

  resources :responses, only: [:show] do
    resources :replies, only: [:create]
  end

  get "menu/rule" => "menus#rule"
  get "menu/help" => "menus#help"
  get "menu/what" => "menus#what"
  get "menu/contact" => "menus#contact"

end
