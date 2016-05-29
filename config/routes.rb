Rails.application.routes.draw do
    get "jobs/change_cover", to: "jobs#change_cover", as: "change_cover"
    get "/admin", to: "sessions#new"
    post "/admin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :jobs do 
        resources :content_sections
    end
    resources :tags
    resources :clients
    get "/index.js", to: "pages#index", defaults: { format: "js"}
    get "/index", to: redirect("/")
    root to: "pages#index"
end