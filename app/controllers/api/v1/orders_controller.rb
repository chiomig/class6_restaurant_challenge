module Api::V1
  class OrdersController < ApiController

    def index
      @orders = Order.all

      render json: @orders
    end

    def create

      items = Item.where(id: params[:order][:item_ids])

      total = items.inject(0.0) { |memo, item| item.price + memo }

      @order = Order.new(order_params)
      @order.items << items
      @order.total = total

      if @order.save
        render json: @order
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      @order = Order.find(params[:id])

      render json: @order
    end

    private

    def order_params
      params.require(:order).permit(:user_id)
    end
  end
end
