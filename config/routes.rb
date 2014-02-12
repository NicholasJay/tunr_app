Tunr::Application.routes.draw do
    resources :artists do
      resources :songs
    end

    resources :users
    get "/sessions", to: "sessions#new"
    post "/sessions", to: "sessions#create"
    delete "/sessions", to: "sessions#destroy"

    root "welcome#index"
end
