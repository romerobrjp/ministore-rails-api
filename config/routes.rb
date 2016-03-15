Rails.application.routes.draw do
  root to: 'api/v1/products#index'

  namespace :api, defaults: { format: :json } do
    scope module: :v1, path: :v1 do
      resources :products , only: [:index, :create, :show, :update, :destroy]
    end
  end
end
