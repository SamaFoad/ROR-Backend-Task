Rails.application.routes.draw do
 namespace :api, defaults: { format: :json } do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # route whereami gets (ip, country, language)
      get "/whereami", to: "ips#index"

      # route employees
      get "/employees", to: "employees#index"

      # routes CRUD for weather
      post "/weather", to: "weathers#create"
      get "/weather", to: "weathers#index"
      get "/weather/:id", to: "weathers#show"
      put "/weather/:id", to: "weathers#update"
      delete "/weather/:id", to: "weathers#destroy"
    end
  end
end
