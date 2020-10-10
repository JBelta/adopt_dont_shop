class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def pet_index
    @pets = Shelter.shelters_pets
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_info)
    if shelter.save
      redirect_to '/shelters'
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
      if shelter.update(shelter_info)
        redirect_to "/shelters/#{shelter.id}"
      end
  end

  def destroy
    Shelter.find(params[:id]).delete
    redirect_to '/shelters'
  end

  private
  def shelter_info
    params.permit(:name, :address, :city, :state, :zip)
  end
end
