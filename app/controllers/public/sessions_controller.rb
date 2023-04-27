# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :customer_state, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
  # ゲストはログアウト時に投稿・お気に入り・コメント削除
   def destroy
    if current_customer.email == 'guest@example.com'
      Post.where(customer_id: current_customer.id).destroy_all
      Favorite.where(customer_id: current_customer.id).destroy_all
      PostComment.where(customer_id: current_customer.id).destroy_all
      super
    else
     super
    end
   end

   def after_sign_in_path_for(resource)
     posts_path
   end

   def after_sign_out_path_for(resource)
     root_path
   end
   # ゲストログイン
   def guest_sign_in
     customer = Customer.guest
     sign_in customer
     redirect_to posts_path, notice: 'ゲストとしてログインしました。'
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 退会しているかを判断するメソッド
   def customer_state
     @customer = Customer.find_by(email: params[:customer][:email])
     if @customer.valid_password?(params[:customer][:password])
       if @customer.is_deleted == true
         redirect_to new_customer_registration_path
       end
     end
   end
end
