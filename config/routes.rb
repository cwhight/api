Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :documents, only: [:index]
      get '/documents/:title', to: 'documents#show'
      get 'documents/:title/latest', to: 'documents#latest'
      get 'documents/:title/:timestamp', to: 'documents#timestamp'

      post '/documents/:title', to: 'documents#update', as: :document

    end
  end

end

