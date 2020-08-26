class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    favorite = @pet.favorites.create!(pet_id: params[:pet_id])
    redirect_to "/pets/#{params[:pet_id]}"
    flash[:notice] = "#{Pet.find(params[:pet_id]).name} has been added to your favorites"
  end
end
