class HeroinesController < ApplicationController
  before_action :current_heroine, except: [:index, :new, :create]

  def index
    @heroines = Heroine.all
    
  end
  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      render :new
    end
  end

  private
  def current_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
