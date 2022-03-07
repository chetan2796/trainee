Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"

  get "sign_in",to: "session#new"
  post "sign_in",to: 'session#create'

  delete "logout",to: "session#destroy"

  get "dashboards",to: 'dashboard#index'

  get "edit_employee/:id", to: 'dashboard#edit'

  get "dashboard", to: "dashboard#new"
  post "dashboard",to: "dashboard#create"

  delete "loggout",to: "dashboard#destroy" 
end
