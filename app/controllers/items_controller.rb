class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def set_item
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def show
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
      render  new_item_path
    end
  end
  
  def edit
    unless @item.user_id == current_user.id
      redirect_to  root_path
    end
  end
  
  def update
    if @item.update(item_update_params)
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
  
  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path, notice: "商品が削除されました"     
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end
  
  def items_search
    @items = Item.items_search(params[:keyword])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def item_update_params
    params.require(:item).permit(
      :name, :description, :status, :price, :payer, :preday, :sold, :postage_type_id, :category_id, :prefecture,
      [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
      
    end
    
    def set_item
      @item = Item.find(params[:id])
    end
  end