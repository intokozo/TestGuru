Rails.application.routes.draw do
  resources :test_passages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
  end
  post 'start', on: :member
end
  root 'tests#index'

  resources :test_passages, only: %i[show update] do
    get 'result', on: :member
  end
end
