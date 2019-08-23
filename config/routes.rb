Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  #devise_scope :user do
  #  get 'mypage' => 'users/registrations#show'
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'

  resources :posts do

  end

  resources :users, :only => [:show] do

  end

end
