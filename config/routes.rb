Rails.application.routes.draw do
  get 'jobs/index'

  get 'jobs/show'

	resources :jobs, path: "/"
end