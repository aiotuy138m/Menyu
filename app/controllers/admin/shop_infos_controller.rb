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
  end

  def update
  end

  def destroy
  end
  
  private
  
  def shop_info_params
    params.require(:shop_info).permit(:name, :shop_address, :shop_url)
  end
end
