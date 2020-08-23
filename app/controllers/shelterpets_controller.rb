class ShelterpetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    if params[:adoptable] == "true"
      @shelter_pets = Shelter.find(params[:id]).pets.find_all {|pet| pet.status == "Adoptable"}
    elsif params[:adoptable] == "false"
      @shelter_pets = Shelter.find(params[:id]).pets.find_all {|pet| pet.status == "Pending Adoption"}
    else
      @shelter_pets = Shelter.find(params[:id]).pets
    end
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet = Pet.new({
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      image_path: params[:pet][:image_path],
      shelter_id: params[:pet][:shelter_id],
      description: params[:pet][:description]
      })
    pet.save
    redirect_to "/shelters/#{params[:pet][:shelter_id]}/pets"
  end
end
