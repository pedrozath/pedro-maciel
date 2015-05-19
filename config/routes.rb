Rails.application.routes.draw do
	get "admin", to: "sessions#new"
	delete "admin", to: "sessions#destroy"
	get "/", to: "events#graphic_design", constraints: {subdomain: "graphicdesign"}
	resources :sessions, path: "admin"
	resources :events, path: "/" do 
		resources :files
	end
end