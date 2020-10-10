class Shelter < ApplicationRecord
  has_many :pets

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def self.shelters_pets

    where(id: Pet.select(:shelter_id)).first.pets.to_a
  end
end
