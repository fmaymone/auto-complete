# frozen_string_literal: true

Rails.application.routes.draw do
  get 'typehead/:prefix' => 'person#search'
  get 'typehead' => 'person#index'
  post 'typehead/:prefix' => 'person#increase_popularity'
end

# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v1 do
#       resources :posts
#     end
#   end
# end
