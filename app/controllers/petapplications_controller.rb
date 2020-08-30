class PetapplicationsController < ApplicationController
  def index
    @petapplications = Pet.find(params[:id]).applications
  end
end
