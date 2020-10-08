class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
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

  private
  def shelter_info
    params.permit(:name, :address, :city, :state, :zip)
  end
end
