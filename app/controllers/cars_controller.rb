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
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car created successfully."
      redirect_to car_path(@car)
    else
      render :new
    end
 end 

  def show
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    brinding.pry
    if @car.update_attributes(car_params)
      flash[:notice] = "Car updated successfully."
      redirect_to car_path(@car)  
    else
      render :edit

    end
  end 


  def destroy
    car = Car.find(params[:id]).destroy
    flash[:notice] = "Car '#{car.Modelo}' destroyed successfully."
    redirect_to(:action => 'index')
  end
  

 private 

    def car_params
      params.require(:car).permit(:Marca, :Modelo)
    end



end
