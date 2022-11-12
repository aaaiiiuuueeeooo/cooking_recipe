Rails.application.routes.draw do

devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end
scope module: :public do
root to: 'homes#top'
  get 'homes/top'
  resources :customers
  resources :homes
  resources :recipes

end
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :customers

    resources :recipes

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
