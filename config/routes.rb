Rails.application.routes.draw do
  
  
  get 'posts/index'
  get '/' => 'home#index'
  get 'home/about' => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
