class ItemsController < ApplicationController
  
  def index
  @items  = current_user.items
  @item = Item.new(user_id: current_user.id)
  end

  def new
  end


  def create 
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "successful"
      redirect_to user_items_path(current_user)
    else
      redirect_to user_items_path(current_user)
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def show
   @item = current_user.items.find(params[:id])
  end
 
 def destroy
  @item = current_user.items.find(params[:id]).destroy
  redirect_to user_items_path(current_user)  
 end

 private
    
  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end


end
