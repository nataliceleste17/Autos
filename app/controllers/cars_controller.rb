class CarsController < ApplicationController
  
layout false

  def index
    @cars = Car.all
  end

  def delete
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def new

    @car = Car.new()

  end

  def create
    #Instantiate a new object using form parameters
    @car = Car.new(car_params)
    #Save the object
    if @car.save
      #If save succeeds, redirect to index action
      flash[:notice] = "Car created successfully."
      redirect_to(:action => 'index')
    else
      #If save fails, redisplay the form so user can fix problems
      render('new')
    end
 end 

  def show
    @car = Car.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @car = Car.find(params[:id])
    # Update the object
    if @car.update_attributes(car_params)
      #If update succeeds, redirect to index action
      flash[:notice] = "Car updated successfully."
      redirect_to(:action => 'show', :id => @car.id)
    else
      #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end 
  def destroy
    car = Car.find(params[:id]).destroy
    flash[:notice] = "Car '#{car.Modelo}' destroyed successfully."
    redirect_to(:action => 'index')
  end
  def part_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:part).permit(:Nombre, :Cantidad)
    end

 private 

    def car_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:car).permit(:Marca, :Modelo)
    end



end
