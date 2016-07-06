Rails.application.routes.draw do

  root 'welcome#index'
  resources :emails, only: [:create]
  get '/resume', to: 'welcome#resume', as: "resume"

end
