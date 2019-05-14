Rails.application.routes.draw do
  # For a deeper usage regarding user operations with devise, modify devise routes configuration
  devise_for :users,
             skip: [:passwords, :registrations],
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
             },
             controllers: {
                 sessions: 'sessions',
             }
  as :user do
    post '/signup' => 'registrations#create'
  end

  resources :users
  resources :customers
end
