Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    resources :categories
    resources :lawyers
    root to: 'lawyers#index'
  end

  mount RedactorRails::Engine => '/redactor_rails'
  root 'lawyers#index'

  # I moved other lawyers resources to admin above, so its corresponding actions and views are useless, and I did comment them out.
  # This is why my lawyers route is as is below!!!
  resources :lawyers, except: [:index, :new, :edit, :create, :update, :destroy]
  get 'lawyers/:id/preview' => 'lawyers#preview', as: :preview_lawyer
  #get 'new' => 'lawyers#new', as: :new

  resources :categories, only: [:index, :create]


  get '/404' => 'application#not_found'
  get '/500' => 'application#exception'


end

=begin
if Rails.env.production?
      match '*path' => 'application#page_not_found', via: :all
      match '*path' => 'application#server_error', via: :all
  end
=end