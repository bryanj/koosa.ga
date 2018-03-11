Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/login", to: "users#login"
  post "/login", to: "users#login_proc"
end
