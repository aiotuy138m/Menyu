class Admin::ShopInfosController < ApplicationController
  def new
    @shop_info = ShopInfo.new
  end
  
  def create
    @shop_info = ShopInfo.new(shop_info_params)
    if @shop_info.save
      redirect_to admin_shop_infos_path
    else
      render :new
    end
  end
  
  def index
  end

  def edit
    @shop_info = ShopInfo.find(params[:id])
  end

  def update
    @shop_info = ShopInfo.find(params[:id])
    if @shop_info.update(shop_info_params)
      redirect_to new_admin_shop_info_path
    end
  end

  def destroy
  end
  
  private
  
  def shop_info_params
    params.require(:shop_info).permit(:name, :shop_address, :shop_url)
  end
end
