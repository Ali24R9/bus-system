BusTimetable::Application.routes.draw do
  resources :lines, :except => [:new]
  resources :stations, :except => [:new]
  resources :stops, :except => [:new]
end
