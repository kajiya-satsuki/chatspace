Rails.application.routes.draw do
  devise_for :users
  get 'messages' => 'messages#index'
  get 'user' => 'user#edit'
end
