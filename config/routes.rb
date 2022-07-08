Rails.application.routes.draw do
  get 'welcome/index'
  get 'page/index'
  # crea le routes per operazioni standard (bisogna però lanciare il comando generate controller per creare il corrispondente controller)
  resources :articles do
    resources :comments
  end
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



