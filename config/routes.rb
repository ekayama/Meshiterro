Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  root 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  # ↓部分　resources :post_images, only: [:new, :create, :index, :show]　だと永遠にルーティングエラー出た
  # 理由もよく分からないし、AIに全部投げたら以下のコード吐き出した。末尾にコントローラ：ポスト〜とか書いたら全部変わっちゃうんじゃないの？
  # というかそもそも末尾に繋げていいいの？　全然分からないんだけど。
  resources :post_images, only: [:new, :create, :index, :show, :destroy], controller: 'post_image'
  resources :users, only: [:show, :edit, :update]
  

end
