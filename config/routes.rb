MilleGruyere::Application.routes.draw do
  resources :athletes
  resources :categories

  get  '/categories/:id/startliste',             to: 'categories#startliste'
  get  '/categories/:id/rangliste',              to: 'categories#rangliste'
  post '/categories/:id/result',                 to: 'categories#result'
  get  '/categories/:category/diplom/:athlete',  to: 'categories#diplom'

  root to: 'application#index'
end
