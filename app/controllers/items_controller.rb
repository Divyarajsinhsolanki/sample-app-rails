class ItemsController < ApplicationController
  def index

  @items  = current_user.items

  end

  def new
    @item = current_user.items.new()
  end


  def create 
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "successful"
      redirect_to user_items_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def show
   @item = current_user.items.find(params[:id])
  end


 private
    
  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end


end
