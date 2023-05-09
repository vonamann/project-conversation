Rails.application.routes.draw do
  root 'projects#show'
  patch '/' => 'projects#update'
  get '/history' => 'project_histories#index'
  resources :comments, controller: 'project_comments', only: %i[index new create]
end
