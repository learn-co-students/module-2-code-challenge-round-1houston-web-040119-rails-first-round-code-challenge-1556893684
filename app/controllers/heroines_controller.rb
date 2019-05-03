class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    @result = params[:q]
    if @result 
      @searched_heroines = @heroines.select {|h| h.power.name.include? @result}
    end
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
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end
  
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
