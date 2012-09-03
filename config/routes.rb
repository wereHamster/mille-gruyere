Mille::Application.routes.draw do
  resources :athletes
  resources :categories

  get  '/categories/:id/rangliste', to: 'categories#rangliste'
  get  '/categories/:category/diplom/:athlete', to: 'categories#diplom'

  post '/categories/:id/result',    to: 'categories#result'

  root to: 'application#index'
end
