class PetsController < ApplicationController

  def index
    if params[:adoptable] == "true"
      @pets = Pet.all.find_all {|pet| pet.status == "Adoptable"}
    elsif params[:adoptable] == "false"
      @pets = Pet.all.find_all {|pet| pet.status == "Pending Adoption"}
    else
      @pets = Pet.all
    end
  end

  def show 
    @pet = Pet.find(params[:id])
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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      image_path: params[:pet][:image_path],
      shelter_id: params[:pet][:shelter_id],
      description: params[:pet][:description],
      status: params[:pet][:status]
      })
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

end
