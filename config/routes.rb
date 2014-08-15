# RAILSCAFE3

Rails.application.routes.draw do

  resources :pastries

  get    'beans/' =>          'beans#index',    as: :beans
  post   'beans/' =>          'beans#create'
  get    'beans/new' =>       'beans#new', as: :new_bean
  get    'beans/:id' =>       'beans#show',     as: :bean
  get    'beans/:id/edit' =>  'beans#edit', as: :edit_bean
  patch  'beans/:id' =>       'beans#update'
  put  'beans/:id' =>       'beans#update'
  delete 'beans/:id' =>       'beans#destroy'

  get 'pairings' => 'pairings#index', as: :pairings
  post 'pairings' => 'pairings#create'
  patch 'pairings' => 'pairings#update'
  put 'pairings' => 'pairings#update'

#  resources :pairings, only: [:index, :create]
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'