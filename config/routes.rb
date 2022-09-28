Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    devise_for :useres
    
    root to: "noticias#index" 

  resources :ramais
  resources :noticias do
      resources :comentarios, only: %i[create destroy]
    end
    resources :categorias, except: [:show]
    resources :jornais
  end

  post 'import_ramais' => "ramais#import_ramais"
  
end
