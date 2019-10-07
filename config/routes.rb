Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  resources :stores do
    collection { post :import}
  end
  resources :products do
    collection { post :import}
  end
  resources :employees do
    collection { post :import}
  end
  resources :orders do
    collection { post :import }
  end
  resources :timecards do
    collection { post :import }
  end

  get '/uploads' => 'upload#index'
end
