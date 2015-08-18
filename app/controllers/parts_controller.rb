class PartsController < ApplicationController
  
  layout false
  
  def index
    
    @parts =Part.all
    $car = params[:car_id]
  end

  def delete
    @part = Part.find(params[:id])
  end

  def edit
    @part = Part.find(params[:id])
  end

  def new
    @auto_id = $car
    @part = Part.new({:Car_id => @auto_id})

  end

  def create
    #Instantiate a new object using form parameters
    @part = Part.new(part_params)
    #Save the object
    if @part.save
      #If save succeeds, redirect to index action
      flash[:notice] = "Part created successfully."
      redirect_to(:action => 'index')
    else
      #If save fails, redisplay the form so user can fix problems
      render('new')
    end
 end 

  def show
    @part = Part.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @part = Part.find(params[:id])
    # Update the object
    if @part.update_attributes(part_params)
      #If update succeeds, redirect to index action
      flash[:notice] = "Part updated successfully."
      redirect_to(:action => 'show', :id => @part.id)
    else
      #If update fails, redisplay the form so user can fix problems
      render('edit')
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

