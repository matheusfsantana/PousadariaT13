class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end
  
  def create
    @list =  current_user.lists.build(list_params)

    return redirect_to lists_path, notice: 'Lista cadastrada com sucesso' if @list.save

    render :new, status: :unprocessable_entity
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
