Rails.application.routes.draw do
  devise_for :useres
  
  get 'home/index'
  root to: "noticias#index" 

  resources :noticias
  resources :categorias, except: [:show]
  resources :jornais
  
end
