class Api::V1::ItemsController < ActionController::API
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.destroy(params[:id])
  end
end
