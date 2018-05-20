Rails.application.routes.draw do
  resources :scent_notes
  resources :scents
  resources :notes
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
