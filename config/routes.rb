Rails.application.routes.draw do
    get "/admin", to: "sessions#new"
    post "/admin", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
    resources :jobs
    root to: redirect("/jobs")
end