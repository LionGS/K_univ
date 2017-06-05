Rails.application.routes.draw do
    root "home#index"
    
  get 'posts/list'
  
  get 'posts/new'

  post 'posts/create'

  get 'posts/show/:post_id' => 'posts#show'

  get 'posts/edit/:post_id' => 'posts#edit'

  post 'posts/update/:post_id' => 'posts#update'

  get 'posts/delete/:post_id' => 'posts#delete'

  # Like route 추가
  resources :posts do
    get "/like", to: "likes#like_toggle"
  end
  
  devise_for :users

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
