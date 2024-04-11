class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to "/lists"
  end

  def new
    @new_list = List.new
  end

  def show
    # get the id with params
    @list_item = List.find(params[:id])
  end

  private
  
  def list_params
    params.require(:list).permit(:name)
  end
end
