Rails.application.routes.draw do
  devise_for :useres
  
  root to: "noticias#index" 

  resources :noticias
  resources :categorias, except: [:show]
  resources :jornais
  
end
