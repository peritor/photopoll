ActionController::Routing::Routes.draw do |map|
  map.resources :photos

  map.resources :photos

  
  map.resources :photos
  
  map.root :controller => "photos"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
