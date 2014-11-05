RR02::Application.routes.draw do

  resources :activity_tracks

  resources :challenge_activities

  resources :activities

  resources :challenges

  controller :challenge_activities do
    get '/challenge_activities/index/:id', to: 'challenge_activities#index', as: 'list_challenge_activities'
    get '/challenge_activities/new/:id', to: 'challenge_activities#new', as: 'add_challenge_activity'
  end

  controller :home do
    get "/home" => :index
    get "/home/about" => :about
  end

  root :to => "home#index"
end
