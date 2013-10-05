JsCourse::Application.routes.draw do
  root to: 'contacts#index'
  resources :contacts, except: :show
  resources :groups, except: :show
end
