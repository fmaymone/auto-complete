# frozen_string_literal: true

Rails.application.routes.draw do
  get 'typehead/:string_to_search' => 'person#search'
end


# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v1 do
#       resources :posts
#     end
#   end 
# end