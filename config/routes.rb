# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search/index'
  get 'category/index'
  get 'random/index'
  get '/query/create' => 'queries#create', :as => :create_query

  get '/search/turbo_frame_form' => 'search#turbo_frame_form', as: 'search_turbo_frame_form'
  post '/search/turbo_frame_submit' => 'search#turbo_frame_submit', as: 'search_turbo_frame_submit'
  
  get '/random/turbo_frame_form' => 'random#turbo_frame_form', as: 'random_turbo_frame_form'
  post '/random/turbo_frame_submit' => 'random#turbo_frame_submit', as: 'random_turbo_frame_submit'
  
  get '/category/turbo_frame_form' => 'category#turbo_frame_form', as: 'category_turbo_frame_form'
  post '/category/turbo_frame_submit' => 'category#turbo_frame_submit', as: 'category_turbo_frame_submit'
  
  root 'search#index'
end
