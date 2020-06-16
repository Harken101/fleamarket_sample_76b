class ItemsController < ApplicationController
  
  def index
  end

  def show
    @images = @item.images
    @children = Category.find(@item[:child_category_id])
    @grandchildren = Category.find(@item[:grandchild_category_id])
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
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id,:child_category_id,:grandchild_category_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(
      :name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id,:child_category_id,:grandchild_category_id, :prefecture,
      [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
  end

end