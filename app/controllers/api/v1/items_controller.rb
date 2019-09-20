module Api::V1
  class ItemsController < ApiController

    def index
      @items = Item.all

      render json: @items
    end

    def create
      @item = Item.new(item_params)

      if @item.save
        render json: @item
      else
        render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      @item = Item.find(params[:id])

      render json: @item
    end

    def update
      @item = Item.find(params[:id])

      if @item.update(item_params)
        render json: @item
      else
        render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def item_params
      params.require(:item).permit(:name, :description, :price, :menu_id)
    end
  end
end
