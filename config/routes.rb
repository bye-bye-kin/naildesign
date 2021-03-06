Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "nails#index"
  resources :users
  resources :nails, only: %i(index new create show destroy) do
    # この行を追加する
    resources :likes, only: %i(create destroy)
  end
end
