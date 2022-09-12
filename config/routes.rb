Rails.application.routes.draw do
  resources :categorias
  
  get 'home/index'
  root to: "noticias#index" 

  resources :noticias
  resources :jornais
  
end
