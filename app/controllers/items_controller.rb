class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :show, :edit, :new]

  def new
    @item = Item.new
  end

  def index
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to '/items'
    else
      render :new
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy
    redirect_to '/items'
  end

  private

  def item_params
    params.require(:item).permit(:shop_name, :address, :image, :search)
  end
end
