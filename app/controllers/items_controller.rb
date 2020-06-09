class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @prefecture = Prefecture.all
    @item.images.new
  end

  def create
    # @item = Item.new(item_params)
    # if @item.images(:image_url).valid?(:validates_image)
    #   @item.save
    #   redirect_to root_path
    # # @item = Item.create(item_params)
    # else
    #   redirect_to new_item_path
    # end
    @item = Item.create(item_params)
    redirect_to new_item_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :user_id, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image_url])
  end


end
