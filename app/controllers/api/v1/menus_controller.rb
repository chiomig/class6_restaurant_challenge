module Api::V1
  class MenusController < ApiController

    def index
      @menus = Menu.all

      render json: @menus
    end

    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        render json: @menu
      else
        render json: { errors: @menu.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      @menu = Menu.find(params[:id])

      render json: @menu
    end

    private

    def menu_params
      params.require(:menu).permit(:name)
    end
  end
end
