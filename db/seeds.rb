# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#shelters
@shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
@shelter_2 = Shelter.create(name: "Cat Cabin", address: "456 Road", city: "Tops", state: "NC", zip: 12321)

#pets
@pet_1 = @shelter_1.pets.create(image: 'dog_01.jpg', name: "Maxine", approximate_age: "7", sex: "F", name_of_shelter: @shelter_1.name, description: "Sweet and Loyal")

@pet_2 = Pet.create(image: 'dog_02.jpg', name: "Slobber", approximate_age: "2", sex: "M", name_of_shelter: @shelter.name, description: "Protective and Active", shelter_id: @shelter_1.id)
