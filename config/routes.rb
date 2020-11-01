Rails.application.routes.draw do
  root 'technologies#index'
  resources :technologies
end
