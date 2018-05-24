Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	# root 'users#index'
  	root 'messages#index' 

 		get 'signup' => 'users#new'
 		resources :users

 
  	get  'login' => 'sessions#new'

		post 'login' => 'sessions#create'

		delete 'logout' => 'sessions#destroy'
		

		get 'messages' => 'messages#index'

		get 'messages/new' => 'messages#new'

		post 'messages' => 'messages#create'


  	get 'cool'  => 'signups#new' 

		get 'about'	=> 'signups#about'

		get 'about/show' => 'signups#show'

		resources :messages


end

