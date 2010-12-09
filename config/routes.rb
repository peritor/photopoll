Photopoll::Application.routes.draw do
  resources :photos do
    resources :ratings
  end

  match '/' => 'photos#index'
  match '/photos/search/' => 'photos#search'
  match '/:controller(/:action(/:id))'
end
