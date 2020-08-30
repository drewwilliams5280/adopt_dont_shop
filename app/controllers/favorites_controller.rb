class FavoritesController < ApplicationController

  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    session[:favorites] ||= Array.new
    session[:favorites] << pet_id_str
    flash[:notice] = "#{Pet.find(params[:pet_id]).name} has been added to your Favorites!"
    redirect_to "/pets/#{params[:pet_id]}"
  end

   def index
     if session[:favorites] == nil || session[:favorites].count == 0
       flash.now[:no_favorites] = "You don't have any favorites!"
     end
   end

   def destroy
     pet = session[:favorites].delete(params[:pet_id])
     flash[:notice] = "#{Pet.find(params[:pet_id]).name} has been removed from your Favorites!"
     if @_request.env["HTTP_REFERER"].include?("pets")
       redirect_to "/pets/#{params[:pet_id]}"
     else
       redirect_to "/favorites"
     end
   end

   def destroyall
     session[:favorites] = Array.new
     redirect_to '/favorites'
   end

   def adopt
   end

end
