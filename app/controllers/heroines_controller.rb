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
    @powers = Power.all
    if power_selection != nil
      @heroines = Heroine.select{|heroine| heroine.power_id == power_selection.id}
      render :index
    else
      flash[:error] = "That power does not exist!"
      @heroines = Heroine.all
      render :index
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end

  def current_heroine
    Heroine.find(params[:id])
  end

  def power_selection
    if params[:power] == ""
      nil
    else
      power_name = params.require(:power)
      Power.find_by(name:power_name)
    end
  end

end
