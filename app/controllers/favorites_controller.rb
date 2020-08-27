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

  def destroy
    if @_request.env["HTTP_REFERER"].include?("pets")
      @favorite_id = Favorite.where(pet_id: params[:id]).pluck(:id)
      Favorite.destroy(@favorite_id)
      redirect_to "/pets/#{params[:id]}"
      flash[:notice] = "#{Pet.find(params[:id]).name} has been removed from your favorites"
    elsif @_request.env["HTTP_REFERER"].include?("favorites")
      flash[:notice] = "#{Favorite.find(params[:id]).pet.name} has been removed from your favorites"
      Favorite.destroy(params[:id])
      redirect_to "/favorites"
    end
  end

end
