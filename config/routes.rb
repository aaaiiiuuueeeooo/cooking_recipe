Rails.application.routes.draw do

devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
}
devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
root to: 'homes#top'
  get 'homes/top'
  get 'customers/index_bookmark'
  resources :customers
  resources :homes
  resources :recipes do
    resources :recipe_names
      collection do
        get 'keyword_search'
      end
  end
  resources :recipes, except: [:index] do
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :comments

end
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :customers

    resources :recipes

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
