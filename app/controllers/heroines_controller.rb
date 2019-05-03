class HeroinesController < ApplicationController
  def index

    # @heroines = Heroine.all
    

@heroines = Heroine.search(params[:search])

    
    
  end
  
  def show
    @heroine = Heroine.find(params[:id])
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
      redirect_to new_heroine_path
    end
  end
  
  
  
  private
  
  def heroine_params
    params.require(:heroine).permit(:name, :power_id, :super_name,:search)
  end
  
  
end
