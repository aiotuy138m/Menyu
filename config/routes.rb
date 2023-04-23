Rails.application.routes.draw do
  # 管理者用
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :edit, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :posts, only: [:index, :destroy, :update, :show]
    resources :shop_infos, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :reports, only: [:index, :show, :update]
  end

  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # 顧客用
  scope module: :public do
    root to: "homes#top"
    resources :customers, except: [:new, :create, :index, :edit, :update, :destroy, :show] do
      collection do
        get 'my_page', action: 'show'
        patch 'information', action: 'update'
        get 'information/edit', action: 'edit'
        get 'confirm'
        patch 'withdraw'
      end
    end
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      collection do
        get 'favorites'
        get 'private', action: 'not_active'
      end
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :reports, only: [:new, :create]
    end
    resources :shop_infos, only: [:index, :show, :edit, :update, :destroy]
  end

# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# ゲストログイン
devise_scope :customer do
  post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

end
