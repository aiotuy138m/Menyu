Rails.application.routes.draw do
  namespace :admin do
    get 'shop_infos/index'
    get 'shop_infos/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/edit'
    get 'posts/show'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
