class PowersController < ApplicationController
  before_action :current_power, except: [:index, :new, :create]
  def index
    @powers = Power.all
  end

  def show
  end

  private
  def current_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
