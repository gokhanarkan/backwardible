require 'sidekiq/web'

# Rails.application.routes.draw do
#     authenticate :user, lambda { |u| u.admin? } do
#       mount Sidekiq::Web => '/sidekiq'
#     end


#   devise_for :users
#   root to: 'home#index'
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do

  root 'home#index'
  get 'top', to: 'home#top'
  get 'table', to: 'home#table'
  get 'search', to: 'home#search'

end
