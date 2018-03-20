Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'users#index' 

 		get 'signup' => 'users#new'
 		resources :users

 	
 
  	


  	get  'login' => 'sessions#new'

		post 'login' => 'sessions#create'

		get 'logout' => 'sessions#destroy'
		

  	get 'cool'  => 'signups#new' 

		get 'about'	=> 'signups#about'

		get 'about/show' => 'signups#show'


end

