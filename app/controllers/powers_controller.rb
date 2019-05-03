class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

 
  

  def show
    @power = Power.find(params[:id])
  end

  # def new
  #   @power = Power.new
  # end
  
  # def create
  #   @power = Power.create(heroine_params)
  #   redirect_to @power
  # end
  
  # def edit
  #   @power = Power.find(params[:id])
  # end

  # def update
  #   @power = Power.find(params[:id])
  #   @power.update(power_params)
  #   redirect_to 
  # end

  # private
  # def power_params
  #   params.require(:heroine).permit(:name, :description)
  # end
  
end
