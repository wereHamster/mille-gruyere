MilleGruyere::Application.routes.draw do
  get  '/athletes/nachmeldungen',  to: 'athletes#nachmeldungen'
  post '/athletes/:id/switch-names',  to: 'athletes#switch_names'
  resources :athletes
  resources :categories

  get  '/categories/:id/startliste',             to: 'categories#startliste'
  get  '/categories/:id/rangliste',              to: 'categories#rangliste'
  post '/categories/:id/result',                 to: 'categories#result'
  get  '/categories/:category/diplom/:athlete',  to: 'categories#diplom'
  get  '/verein/:verein',  to: 'verein#show'

  get  '/startlisten', to: 'application#startlisten'

  root to: 'application#index'
end
