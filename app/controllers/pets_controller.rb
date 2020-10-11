class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    @shelter_id = params[:id]
    pet = Pet.new(pet_params)
    if pet.save
      redirect_to "/shelters/#{@shelter_id}/pets"
    end
  end

  private
  def pet_params
    params.permit(:name,
                  :image,
                  :approximate_age,
                  :description,
                  :sex)
  end
end
