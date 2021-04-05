Rails.application.routes.draw do

	root "pages#index"

  # Users routes
	get "/users", to: "pages#index", :constraints => { :format => "html" }
	get "/users/new", to: "pages#index", :constraints => { :format => "html" }
	get "/users/:id/edit", to: "pages#index", :constraints => { :format => "html" }	

	namespace :api do
		namespace :v1 do
			resources :users
		end
	end
	
	get '/login', to: 'pages#index'
	post '/login', to: "pages#index"
	delete '/logout', to: "pages#index"
	
	namespace :api do
		namespace :v1 do
			resources :sessions
		end
	end

  # Movies routes
	get "/movies", to: "pages#index", :constraints => { :format => "html" }
	get "/movies/new", to: "pages#index", :constraints => { :format => "html" }
	get "/movies/:id/edit", to: "pages#index", :constraints => { :format => "html" }	
	get "/movies/:id", to: "pages#index", :constraints => { :format => "html" }	

	namespace :api do
		namespace :v1 do
			resources :movies
		end
	end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
