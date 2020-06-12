class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def create  
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to  new_item_path
    end
  end

  def buyscreen
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end


end