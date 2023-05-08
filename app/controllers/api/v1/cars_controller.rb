class CarsController < ApplicationController
    before_action :set_car, only: %i[show update destroy]

    # GET /cars
    def index
      @cars = Car.all
  
      render json: @cars
    end
  
    # GET /cars/1
    def show
      render json: @car
    end
  
    # POST /cars
    def create
     @car = Car.create(Car_params)
  
      if @car.save!
        render json: { message: 'Car Created Successfully' }, status: :created
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /cars/1
    def update
      if@car.update(car_params)
        render json: @car
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /cars/1
    def destroy
     @car = Car.find(params[:id])
      if@car.destroy
        render json: { message: 'Car deleted successfully' }, status: :no_content
      else
        render json: @car.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_car
     @car = Car.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:name, :description, :photo, :price, :model, :user_id)
    end
end
