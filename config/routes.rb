Rails.application.routes.draw do
  get 'table/generate'
  get 'table/index'

  root to: 'table#index'
  get '/generate' => 'table#generate'

end
