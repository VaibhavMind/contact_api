Rails.application.routes.draw do
=begin
  get 'profiles/index'

  get 'profiles/new'

  get 'profiles/create'

  get 'profiles/destroy'
=end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # match 'contacts', to: 'contacts#destroy', via: [:options]

  match '*all', to: 'contacts#testcors', :via => [:options]
  #resources :contacts

  resources :contacts, only: [:index, :create,:show,:update,:destroy]

  resources :profiles, only: [:index, :new, :create, :destroy]
end
