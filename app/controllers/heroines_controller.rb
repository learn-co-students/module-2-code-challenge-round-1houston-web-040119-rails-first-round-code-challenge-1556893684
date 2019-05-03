class HeroinesController < ApplicationController
  def index
    @search_text = ""
    powers_arr = Power.all.map { |p| p.name.downcase }

    # bonus: handle search queries on index page
    if params[:search] && powers_arr.include?(params[:search].strip.downcase)
      @power = Power.all.select { |p| p.name.downcase == params[:search].strip.downcase }[0]
      @heroines = Heroine.all.select { |h| h.power_id == @power.id }
      @search_text = params[:search]
    elsif params[:search] && (params[:search].length > 0)
      @error = "Power not found."
      @heroines = Heroine.all
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create 
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end
end
