class ShelterpetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    if params[:adoptable] == "true"
      @shelter_pets = Shelter.find(params[:id]).pets.find_all {|pet| pet.status == "Adoptable"}
    elsif params[:adoptable] == "false"
      @shelter_pets = Shelter.find(params[:id]).pets.find_all {|pet| pet.status.include?("Pending")}
    else
      @shelter_pets = Shelter.find(params[:id]).pets
    end
  end
  
end
