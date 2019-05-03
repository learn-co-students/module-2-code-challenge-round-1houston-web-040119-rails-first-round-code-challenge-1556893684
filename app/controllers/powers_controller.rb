class PowersController < ApplicationController
  before_action :current_power, only: [:show, :edit, :update, :destroy]
  
  def index
    @powers = Power.all
  end

  def show
    @heroines = Heroine.all
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    @power.save
    redirect_to @power

  end

  def edit

  end

  def update
    @power.update(power_params)
    redirect_to @power
  end

  def destroy
    @power.destroy
    redirect_to power_path
  end

  private

  def current_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
