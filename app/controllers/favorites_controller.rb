class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    session[:favorites] ||= Array.new
    session[:favorites] << pet_id_str
    flash[:notice] = "#{Pet.find(params[:pet_id]).name} has been added to your Favorites!"
    redirect_to "/pets/#{params[:pet_id]}"
  end
end
