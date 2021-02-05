Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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

end
