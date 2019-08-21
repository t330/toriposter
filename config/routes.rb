Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'

  resources :posts do

  # post 'posts/new' => 'posts#create'

  end

  resources :users do

    collection do
      get ':current_user.id' => 'users#mypage'
    end

  end

end
