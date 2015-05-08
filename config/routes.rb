Rails.application.routes.draw do
	get "admin" => "sessions#new"
	resources :sessions, path: "admin"
	resources :events, path: "/", only: [:index, :show]
end