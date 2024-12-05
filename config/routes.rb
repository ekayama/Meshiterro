Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

  
  # get 'users/show'
  # get 'users/edit'
  root 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  # ↓部分　resources :post_images, only: [:new, :create, :index, :show]　だと永遠にルーティングエラー出た
  # 理由もよく分からないし、AIに全部投げたら以下のコード吐き出した。末尾にコントローラ：ポスト〜とか書いたら全部変わっちゃうんじゃないの？
  # というかそもそも末尾に繋げていいいの？　
  resources :post_images, only: [:new, :create, :index, :show, :destroy]  do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


end
