Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'server_packages/index'
      post 'server_packages/create'
    end
  end
  namespace :api do
    namespace :v1 do
      get '/servers', to: 'servers#index'
    end
  end
  get '/', to: 'server_packages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
