ActionController::Routing::Routes.draw do |map|
  
  map.resources :photos do |photos|
    photos.resources :ratings
  end
  
  map.root :controller => "photos"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
