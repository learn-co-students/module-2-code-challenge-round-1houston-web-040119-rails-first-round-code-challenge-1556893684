class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def show
    @heroine = current_heroine
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
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to 'heroines/new'
    end
  end

  def edit
    @heroine = current_heroine
    @powers = Power.all
  end

  def update
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      current_heroine.update(heroine_params)
      redirect_to current_heroine
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to 'heroines/edit'
    end
  end

  def destory
    @heroine = current_heroine
    @heroine.destory
    redirect_to heroines_path
  end

  def search
    if power_id != nil
      @heroines = Heroine.find_by(power_id:power_id)
      redirect_to heroines_path
    else
      @heroines = Heroine.all
      redirect_to heroines_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end

  def current_heroine
    Heroine.find(params[:id])
  end

  # def power_selection
  #   byebug
  #   power_name = params.require(:heroine).permit(:power)
  #   power_id = Power.find_by(name:power_name)
  #   byebug
  # end

end
