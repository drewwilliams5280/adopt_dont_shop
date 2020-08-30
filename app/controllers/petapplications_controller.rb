class PetapplicationsController < ApplicationController
    def index
      @petapplications = Pet.find(params[:id]).applications
      if @petapplications.empty?
        flash.now[:notice] = "There are no applications for #{Pet.find(params[:id]).name}."
    end
  end
end
