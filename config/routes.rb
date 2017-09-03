Rails.application.routes.draw do


  get 'admin' => 'admin#index'
  get 'question' => 'static_pages#question'
  get 'news' => 'static_pages#news'
  
  controller :static_pages do
    get 'contact' => :contact
    post 'contact' => :create
  end
  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy
  end 

  get 'sessions/create'
  get 'sessions/destroy'

  get 'store/index'

  resources :products do 
    get :who_bought, on: :member
  end

  scope '(:locale)' do 
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store', via: :all
  end

end
