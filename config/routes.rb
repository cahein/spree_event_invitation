Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :events
  end
end
