Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :type_of_meetings
  resources :meeting_results
  resources :activities
  resources :type_of_letters
  resources :letters
  resources :admins
  resources :users
  root "activities#index"

end
