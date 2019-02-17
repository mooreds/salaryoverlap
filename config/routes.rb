Rails.application.routes.draw do
  resources :salary_data, only: [:new, :create, :show]
  root 'welcome#index'
end
