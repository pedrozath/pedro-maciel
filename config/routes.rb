Rails.application.routes.draw do
	get "admin" => "sessions#new"
	resources :events, path: "/", only: [:index, :show]
end