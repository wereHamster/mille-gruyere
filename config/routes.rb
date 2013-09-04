MilleGruyere::Application.routes.draw do
  get  '/athletes/nachmeldungen',  to: 'athletes#nachmeldungen'
  resources :athletes
  resources :categories

  get  '/categories/:id/startliste',             to: 'categories#startliste'
  get  '/categories/:id/rangliste',              to: 'categories#rangliste'
  post '/categories/:id/result',                 to: 'categories#result'
  get  '/categories/:category/diplom/:athlete',  to: 'categories#diplom'
  get  '/verein/:verein',  to: 'verein#show'

  root to: 'application#index'
end
