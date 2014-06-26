Nsfproject::Application.routes.draw do

  get 'texts/index'

  get 'texts/create'

  get 'calls/index'

  get 'calls/create'

  #get 'admin' => 'admins#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :admins

  get '/interactions' => 'interactions#index'
  get '/interactions/compare/:id1/:id2' => 'interactions#compare'
  get '/interactions/show/:id' => 'interactions#show'
  post '/interactions' => 'interactions#create'

  get '/answers' => 'answers#index'
  post '/answers' => 'answers#create'

  get '/questions' => 'questions#index'
  get '/questions/new' => 'questions#new'
  post '/questions/new' => 'questions#create'

  get '/schedules' => 'schedules#index'
  get '/schedules/new' => 'schedules#new'
  post '/schedules/new' => 'schedules#create'
  get '/schedules/:user' => 'schedules#get_schedule_by_user'

  get '/rules' => 'rules#index'
  get '/rules/new' => 'rules#new'
  post '/rules/new' => 'rules#create'
  get '/rules/:user' => 'rules#get_rules_by_user'

  get '/calls' => 'calls#index'
  post '/calls' => 'calls#create'

  get '/texts' => 'texts#index'
  post '/texts' => 'texts#create'

  get '/users' => 'users#index'
  get '/users/all' => 'users#for_boris'
  get '/users/:uuid' => 'users#request_user_id'


  get '/index' => 'pages#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
