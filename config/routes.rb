Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'captures', to: 'captures#index'
      post 'captures', to: 'captures#create'
    end
  end
  get '/', to: 'captures#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
