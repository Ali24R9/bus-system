BusTimetable::Application.routes.draw do
  resources :lines, :except => [:new]

end
