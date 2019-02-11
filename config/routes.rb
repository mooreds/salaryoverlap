Rails.application.routes.draw do
  resources :salary_data
   root 'welcome#index'
end
