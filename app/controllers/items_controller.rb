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
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
    # .valid?
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :user_id, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image_url])
  end


end
