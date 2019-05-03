class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
    @powers = Power.all
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.assign_attributes(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
