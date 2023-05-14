class Admin::ShopInfosController < ApplicationController
  def new
    @shop_info = ShopInfo.new
  end
  
  def create
    @shop_info = ShopInfo.new(shop_info_params)
    if @shop_info.save
      redirect_to admin_shop_infos_path, success: "保存しました"
    else
      render :new, danger: "保存失敗しました"
    end
  end
  
  def index
    @shop_infos = ShopInfo.page(params[:page]).per(10)
  end

  def edit
    @shop_info = ShopInfo.find(params[:id])
  end

  def update
    @shop_info = ShopInfo.find(params[:id])
    if @shop_info.update(shop_info_params)
      redirect_to admin_shop_infos_path, success: "更新しました"
    end
  end

  def destroy
    @shop_info = ShopInfo.find(params[:id])
    @shop_info.destroy
    redirect_to admin_shop_infos_path, danger: "削除しました"
  end
  
  private
  
  def shop_info_params
    params.require(:shop_info).permit(:shop_name, :address, :shop_url, :latitude, :longitude)
  end
end
