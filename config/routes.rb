Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    resource :check_dictionary_imports, only: :show
    resources :dictionaries, only: [:create, :index] do
      resources :anagrams, only: :show
    end
  end
end
