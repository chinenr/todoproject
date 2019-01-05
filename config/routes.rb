Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  root 'tasks#index'
  
  # postでこのurlパターンでアクセスがあった場合
  # tasksコントローラーのtoggleアクションを実行する意味となる
  post '/tasks/:id/toggle' => 'tasks#toggle'
end
