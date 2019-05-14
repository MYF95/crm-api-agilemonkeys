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

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :customers, only: :index
  end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :users
    resources :customers
  end
end
