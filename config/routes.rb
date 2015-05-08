Rails.application.routes.draw do
	get "admin" => "sessions#new"
	delete "admin" => "sessions#destroy"
	resources :sessions, path: "admin"
	resources :events, path: "/"
end