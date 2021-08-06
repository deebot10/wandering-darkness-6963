class PlottedPlantsController < ApplicationController
  def destroy
    # require 'pry'; binding.pry
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:id])

    plot.plants.destroy(plant)
    redirect_to plots_path
  end  
end