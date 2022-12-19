Rails.application.routes.draw do
  root "books#index"

  resources :books, only: [:index, :edit], defaults: { format: :html }

  scope module: 'api/v1', path: 'api/v1', as: 'api_v1', except: [:new, :edit], defaults: { format: :json } do
    resources :books
  end
end
