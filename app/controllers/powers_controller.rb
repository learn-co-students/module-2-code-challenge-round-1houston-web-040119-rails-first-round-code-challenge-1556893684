class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = current_power
  end

  def new
    @power = Power.new
    @heroines = Heroine.all
  end

  def create
    @power = Power.new(power_params)
    if @power.valid?
      @power.save
      redirect_to @power
    else
      flash[:error] = @power.errors.full_messages
      redirect_to 'powers/new'
    end
  end

  def edit
    @power = current_power
    @heroines = Heroines.all
  end

  def update
    byebug
    @power = Power.new(power_params)
    if @power.valid?
      current_power.update(power_params)
      redirect_to current_power
    else
      flash[:error] = @power.errors.full_messages
      redirect_to 'powers/edit'
    end
  end

  def destory
    @power = current_power
    @power.destory
    redirect_to power_path
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
