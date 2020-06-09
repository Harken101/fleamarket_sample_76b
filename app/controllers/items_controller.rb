class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @prefecture = Prefecture.all
    @item.images.build
  end

  def create  
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to  new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :user_id, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image])
  end


end
