class GardensController < ApplicationController

  def show
    # require 'pry'; binding.pry
    @garden = Garden.find(params[:id])
  end
end