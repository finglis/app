class ItemsController < ApplicationController
  def index
    #if @items is used then display all the items
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

    private
    def item_params
      params.require(:item).permit(:name, :price, :quantity, :offer)
    end
end
