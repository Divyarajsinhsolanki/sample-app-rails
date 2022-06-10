class ItemsController < ApplicationController
  
  def index
    @items = current_user.items
    @item ||= current_user.items.find(params[:id]) if params[:id].present?
  end

  def new
    @item  = Item.new
  end

  def create 
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "successful"
      redirect_to user_items_path(current_user)
    else
      flash[:danger] = "Invalid"
      redirect_to user_items_path(current_user)
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    
    if @item.update(item_params)
      flash[:success] = "Item detail updated"
      redirect_to user_items_path(current_user)
    else
      flash[:danger] = "Invalid input"
      redirect_to user_items_path(current_user)
    end
  end

  def destroy
    @item = current_user.items.find(params[:id]).destroy
    redirect_to user_items_path(current_user)  
  end

 private  

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end
end
