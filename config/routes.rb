Rails.application.routes.draw do
  root 'projects#show'
  get '/history' => 'project_histories#index'
end
