Rails.application.routes.draw do
  root 'projects#show'
  patch '/' => 'projects#update'
  get '/history' => 'project_histories#index'
end
