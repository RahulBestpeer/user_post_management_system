Rails.application.routes.draw do

  root "users#login_form"
  get '/users/:user_id/posts/comments', to: 'comments#index'
  get '/users/:user_id/posts/:post_id/comments/show', to: 'comments#show'
  delete '/users/:user_id/posts/:post_id/comments/delete', to: 'comments#destroy'


 resources :users do
   collection do
    post 'login'
    get 'logout'
    get 'login_form'
   end
   resources :posts do
     resources :comments, only: [:destroy, :new, :edit, :create, :update]
   end

 end
end
