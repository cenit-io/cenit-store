Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Payola::Engine => '/payola', as: :payola

  root to: 'plans#index'

  get 'plans/index'

  devise_for :users, :controllers => { :registrations => 'registrations' }

  devise_scope :user do
    put 'change_plan', :to => 'registrations#change_plan'
  end

  resources :users
end
