class PlantsController < ApplicationController
    wrap_parameters format:[]
  def index
   plants = Plant.all
   render json: plants, only: [:id, :name, :image, :price], status: :ok
  end
  def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant, only: [:id,:name, :image, :price], status: :ok
      else
        render json: {error: 'plant not found!'}, status: :not_found
      end
    end
      def create
      new_plant = Plant.create(plant_params)
      if new_plant
        render json: new_plant, only: [:id, :name, :price, :image], status: :created
      else
        render json: {error: "plant not saved!"}
      end
    end
  private
  def plant_params
   params.permit(:name, :image, :price)

  end
end
