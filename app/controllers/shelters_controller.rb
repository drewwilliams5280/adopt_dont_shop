class SheltersController < ApplicationController

  def index
    if params[:sort_by] == "pets"
      @shelters = Shelter.sort_by_pet_count
    elsif params[:sort_by] == "alphabetical"
      @shelters = Shelter.sort_by_name
    else
      @shelters = Shelter.all
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      shelter.save
      redirect_to '/shelters'
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def sort
    @shelters = Shelter.all.sort_by {|shelter| shelter.pets.count}
    redirect_to '/shelters'
  end

  def review
    @shelter = Shelter.find(params[:id])
  end

  def reviewcreate
    review = Review.create!({
      title: params[:title],
      content: params[:content],
      picture: params[:picture],
      rating: params[:rating],
      shelter_id: params[:id]
      })
      redirect_to "/shelters/#{params[:id]}"
  end

end
