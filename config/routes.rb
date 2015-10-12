Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

	get "admin", to: "sessions#new"
	delete "admin", to: "sessions#destroy"
	
	get "/", as:"design_works", to: "files#index", constraints: {subdomain: "designer"}
	get "/", as:"biography", to: "events#index", constraints: {subdomain: "bio"}
	
	resources :projects
	resources :pictures
	resources :movies
	
	resources :sessions, path: "admin"
	resources :events do 
		resources :files
	end
	get "set-language/:locale", to: "locale#update"
	root to: "pages#index"
end