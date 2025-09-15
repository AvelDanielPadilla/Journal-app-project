Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
  get '/users' => "users#index"
  get "/users/new" => "users#new", as: "new_user"
  post "/users" => "users#create", as: "create_user"
  get "/users/:id" => "users#show", as: "user"
  get "/users/:id/edit" => "users#edit", as: "edit_users"
  put "users/:id" => "users#update", as: "update_user"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#delete", as: "delete_user"

  post "/users/sign_in" => "users#sign_in", as: "sign_in_user"

  get '/categories' => "users#index"
  get "/categories/new" => "categories#new", as: "new_category"
  post "/categories" => "categories#create", as: "create_cat"
  get "/categories/:id" => "categories#show", as: "category"
  get "/categories/:id/edit" => "categories#edit", as: "edit_category"
  put "categories/:id" => "categories#update", as: "update_category"
  patch "categories/:id" => "categories#update"
  delete "categories/:id" => "categories#delete", as: "delete_category"

  get '/tasks' => "tasks#index"
  get "/tasks/new" => "tasks#new", as: "new_task"
  post "/tasks" => "tasks#create", as: "create_task"
  get "/tasks/:id" => "tasks#show", as: "task"
  get "/tasks/:id/edit" => "tasks#edit", as: "edit_task"
  put "tasks/:id" => "tasks#update", as: "update_task"
  patch "tasks/:id" => "tasks#update"
  delete "/tasks/:id" => "tasks#delete", as: "delete_task"

  # get "sign_up", "user#new"
  # post "sign_up", to "user#create"



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
