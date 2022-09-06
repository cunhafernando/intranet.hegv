Rails.application.routes.draw do
  
  get 'home/index'
  root to: "noticias#index" 

  resources :noticias
  resources :jornais
  
end
