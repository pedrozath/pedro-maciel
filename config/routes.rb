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
    root to: redirect("/jobs")
end