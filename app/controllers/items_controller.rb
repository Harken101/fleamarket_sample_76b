class ItemsController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def new
    @item = Item.new
    @images = @item.images.build
    # Categoriesテーブルの上から13個のレコードを取り出す
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create  
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to  new_item_path
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def search_two
    respond_to do |format|
      format.html
      format.json do
       @grandchildren = Category.find(params[:child_id]).children
       #子ボックスのidから孫ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def buyscreen
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id, :prefecture, images_attributes: [:image]).merge(user_id: current_user.id)
  end


end