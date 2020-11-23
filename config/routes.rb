Rails.application.routes.draw do
  get 'comments/edit'
  root 'technologies#index'
  resources :technologies do
    resources :comments
  end
end
