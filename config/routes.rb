Tunr::Application.routes.draw do
    resources :artists do
      resources :songs
    end

    resources :users

    root "welcome#index"
end
