Rails.application.routes.draw do
  resources :salary_data, only: [:new, :create, :show]
  get 'salary_data/link/:linkguid', to: 'salary_data#link'
  root 'welcome#index'
end
