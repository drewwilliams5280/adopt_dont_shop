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
    if params[:title] == "" || params[:content] == "" || params[:rating] == ""
      flash[:notice] = "Please fill in Title, Rating, and Review sections"
      redirect_to "/shelters/#{params[:id]}/review"
    else
      if params[:picture].empty?
        params[:picture] = "https://library.kissclipart.com/20180918/fve/kissclipart-5-star-review-icon-clipart-computer-icons-customer-8cca472f2faf8b7d.jpg"
      end
      review = Review.new(review_params)
      review.shelter_id = params[:id]
      review.save!
      flash[:notice] = "Review successfully created"
      redirect_to "/shelters/#{params[:id]}"
    end
  end

  def reviewedit
    @review = Review.find(params[:review_id])
  end

  def reviewupdate
    if params[:content] == "" || params[:rating] == "" || params[:title] == ""
      flash[:notice] = "Please fill in Title, Rating, and Review sections"
      redirect_to "/shelters/#{params[:id]}/#{params[:review_id]}/edit"
    else
      if params[:picture].empty?
        params[:picture] = "https://library.kissclipart.com/20180918/fve/kissclipart-5-star-review-icon-clipart-computer-icons-customer-8cca472f2faf8b7d.jpg"
      end
    review = Review.find(params[:review_id])
    review.update(review_params)
    review.save!
    flash[:notice] = "Review Successfully Updated"
    redirect_to "/shelters/#{review.shelter.id}"
  end
  end

  def reviewdestroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

  private
  def review_params
    params.permit(:title, :content, :picture, :rating)
  end

end
