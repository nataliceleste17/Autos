class PartsController < ApplicationController
  
  layout false
  
  def index
   
   @parts = if params[:car_id]
             Part.where(Car_id: params[:car_id])
          #  else
           #    Part.all
           end
    @car_id = params[:car_id]
  end

  def delete
    @part = Part.find(params[:id])
  end

  def edit
    @part = Part.find(params[:id])
    @part = Part.new({:Car_id => @car_id})
  end

  def new
    @car_id = params[:car_id]
    @part = Part.new({:Car_id => @car_id})
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      flash[:notice] = "Part created successfully."
      redirect_to(:action => 'index', car_id: @part.Car_id)
    else
      render('new')
    end
 end 

  def show
    @part = Part.find(params[:id])
    @car_id = params[:car_id]
  end

  def update
    @part = Part.find(params[:id])
    if @part.update_attributes(part_params)
      flash[:notice] = "Part updated successfully."
      redirect_to(:action => 'index', car_id: @part.Car_id)
    else
      #If update fails, redisplay the form so user can fix problems
      render edit
    end
  end 
  def destroy
    car = Part.find(params[:id]).destroy
    flash[:notice] = "Part '#{part.Nombre}' destroyed successfully."
    redirect_to(:action => 'index')
  end
  

 private 

    def part_params
      # same as using "params[:part]", except that it:
      # - raises an error if :part is not present
      # - allows listed attributes to be mass-assigned
      params.require(:part).permit(:Nombre, :Cantidad, :Car_id)
    end



end

