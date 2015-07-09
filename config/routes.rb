DependencyTracker::Application.routes.draw do

  resources :javascript_dependencies

  resources :projects do
    resources :dependencies
    resources :javascript_dependencies
  end


  resources :dependencies

  post 'dependencies/approve' => 'dependencies#approve', as: :approve_javascript_dependency
  post 'javascript_dependencies/approve' => 'javascript_dependencies#approve', as: :approve_dependency

  root :to => 'projects#index'
end
