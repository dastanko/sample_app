SampleApp::Application.routes.draw do
  root :to => "pages#home"

  resources :users

  match "/contact", :to => "pages#contact"
  match "/about", :to => "pages#about"
  match "/help", :to => "pages#help"
  match "/signup", :to => "users#new"
end
