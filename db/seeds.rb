# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create( name: "Drew's Rescue",
                            address: "208 Main St.",
                            city: "Denver",
                            state: "CO",
                            zip: 80222,
                            )
jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
review = shelter_1.reviews.create!(title: "Terrible Service",
                          rating: "2",
                          content: "Manager was very rude and slapped a kitten!",
                          picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                          )
