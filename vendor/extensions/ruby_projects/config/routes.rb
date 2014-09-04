Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :ruby_projects do
    resources :ruby_projects, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :ruby_projects, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :ruby_projects, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
