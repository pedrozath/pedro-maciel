Rails.application.routes.draw do
    get "jobs/change_cover", to: "jobs#change_cover", as: "change_cover"
    get "/admin", to: "sessions#new"
    post "/admin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :jobs, path: "portfolio", controller: "portfolio" do 
        resources :content_sections
    end
    resources :tags
    resources :clients

    get "/portfolio/:job/:id/:direction", to: "content_sections#move"

    get "/index.js", to: "pages#index", defaults: { format: "js"}
    get "/index", to: redirect("/")
    root to: "pages#index"
end