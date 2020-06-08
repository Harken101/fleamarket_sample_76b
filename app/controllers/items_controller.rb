class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @prefecture = Prefecture.all
    @item.images.new
  end

  def create
    Item.create(item_params)
    redirect_to new_item_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :user_id, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image_url])
  end


end
