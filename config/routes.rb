Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get '/questions/new/(:parent_id)', to: 'questions#new', as: :new_question

  resources :questions, only: [:index, :create, :edit, :show, :update, :destroy] do
  	resources :questions
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
