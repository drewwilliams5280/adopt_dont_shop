class ApplicationsController < ApplicationController

  def index
    @application = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    application = Application.new(name: params[:name][:name],
                                      address: params[:address][:address],
                                      city: params[:city][:city],
                                      state: params[:state][:state],
                                      zip: params[:zip][:zip],
                                      phone_number: params[:phone_number][:phone_number],
                                      description: params[:description][:description])
    if application.save
      params[:pet][:id].each do |id|
        application.pets << Pet.find(id)
        session[:favorites].delete(id)
      end
      redirect_to '/favorites'
      flash[:application_success] = "Your application went through for the pets that were selected."
    else
      redirect_to '/favorites/adopt'
      flash[:application_failure] = "You must fill in all fields in order to submit application."
    end
  end

end
