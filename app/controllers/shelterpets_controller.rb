class ShelterpetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    @shelter_pets = Shelter.find(params[:id]).pets
  end

  def new
    @shelter = Shelter.find(params[:id])
    # binding.pry
  end
end
