Rails.application.routes.draw do
  devise_for :useres
  
  root to: "noticias#index" 

  resources :noticias do
    resources :comentarios, only: %i[create destroy]
  end
  resources :categorias, except: [:show]
  resources :jornais
  
end
