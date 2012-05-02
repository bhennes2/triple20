Triple20App::Application.routes.draw do
  
  
  get '/' => 'games#index', :as => 'games'
  post '/' => 'games#create'
  
  get '/game/new', :controller => 'games', :action => 'new', :as => 'new_game'
  
  get '/games/:id', :controller => 'games', :action => 'show', :as => 'game'
  put '/games/:id', :controller => 'games', :action => 'update'
  delete '/games/:id', :controller => 'games', :action => 'destroy'
  
  get '/games/:id/edit', :controller => 'games', :action => 'edit', :as => 'edit_game'
  
  get '/live/:id', :controller => 'games', :action => 'live', :as => 'live_game'
  
end
