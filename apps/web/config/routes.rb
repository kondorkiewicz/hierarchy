# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/ascents', to: 'ascents#index'
resources :lines, only: [:index, :new, :create]
