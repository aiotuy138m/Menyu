class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  # 未ログインアクセス制限
  def authenticare_customer
    if current_customer == nil
      redirect_to new_customer_session_path, danger: "会員専用ページです。ログインしてください"
    end
  end
  
  # ログインユーザーのみが編集可能
  def ensure_correct_customer
    unless current_customer
      redirect_to my_page_customers_path, danger: "該当ユーザーのみが編集できます"
    end
  end
end
