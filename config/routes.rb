Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }

  get 'dashboard', to: 'dashboard#index'

  resources :towers, only: :index do
    get '/:id', to: 'towers#theme', as: :theme, on: :collection
    get '/:theme_id/:id', to: 'towers#category', as: :category, on: :collection

    get '/:id', to: 'reports#show', as: :report, on: :member
  end

  post 'search', to: 'towers#search', as: :search_towers

  get 'apply-tower-guards', to: 'tower_guards#apply'
  get 'apply-tower-guards-confirm', to: 'tower_guards#apply_confirm'
  post 'apply-tower-guards', to: 'tower_guards#apply_create'

  get 'settings', to: 'settings#index'
  post 'update-user-infos', to: 'settings#update_user_infos'
  post 'update-user-password', to: 'settings#update_user_password'

  resource :subscription, only: [:create, :edit, :update] do
    post 'simulate'
    get 'payment'
    get 'confirmation'
  end

  get ':id', to: 'towers#show', as: :tower

end
