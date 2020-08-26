class FavoritesController < ApplicationController
  def index
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @pet.favorites.create!(pet_id: params[:pet_id])
    binding.pry
    redirect_to "/pets/#{params[:pet_id]}"
    flash[:notice] = "#{Pet.find(params[:pet_id]).name} has been added to your favorites"
  end
end
