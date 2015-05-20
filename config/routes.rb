Rails.application.routes.draw do
	root to: "pages#index"
	get "admin", to: "sessions#new"
	delete "admin", to: "sessions#destroy"
	get "/", to: "events#graphic_design", constraints: {subdomain: "graphicdesign"}
	resources :sessions, path: "admin"
	resources :events, path: "biography" do 
		resources :files
	end
	get "set-language/:locale", to: "locale#update"
end