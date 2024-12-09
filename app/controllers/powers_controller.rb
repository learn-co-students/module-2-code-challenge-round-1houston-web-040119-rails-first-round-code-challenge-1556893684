class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = current_power
  end

  private

  def power_params
    byebug
    params.require(:power).permit(:name,:description, :heroines[])
  end

  def current_power
    Power.find(params[:id])
  end

end
