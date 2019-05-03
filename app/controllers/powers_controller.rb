class PowersController < ApplicationController

  before_action :current_power, only: [:show]
  def index
    @powers = Power.all
  end

  def show

  end

  private

  def current_power
    @power = Power.find(params[:id])
  end


end
