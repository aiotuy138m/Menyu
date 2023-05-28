class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  
  def authenticare_customer # 未ログインアクセス制限
    if current_customer == nil
      redirect_to new_customer_session_path, danger: "会員専用ページです。ログインしてください"
    end
  end
  
  def ensure_correct_customer # ログインユーザーのみが編集可能
    if current_customer.id != params[:id].to_i
      redirect_to my_page_customers_path, danger: "該当ユーザーのみが編集できます"
    end
  end
end
