# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetApplication.destroy_all
Review.destroy_all
Pet.destroy_all
Shelter.destroy_all
Application.destroy_all

shelter_1 = Shelter.create( name: "Drew's Rescue",
                            address: "208 Main St.",
                            city: "Denver",
                            state: "CO",
                            zip: 80222,
                            )
shelter_2 = Shelter.create( name: "Happy Paws",
                           address: "222 22nd Ave.",
                           city: "Denver",
                           state: "CO",
                           zip: 82222,
                           )
shelter_3 = Shelter.create( name: "Fuzzy Friends",
                          address: "444 44th Ave.",
                          city: "Denver",
                          state: "CO",
                          zip: 84444,
                          )
shelter_4 = Shelter.create( name: "God's Little Angels",
                            address: "777 Golden Brick Rd.",
                            city: "Denver",
                            state: "CO",
                            zip: 80777,
                            )
shelter_5 = Shelter.create( name: "Zeus's Palace",
                            address: "1011 Parthenon Pl.",
                            city: "Denver",
                            state: "CO",
                            zip: 80321,
                            )
shelter_6 = Shelter.create( name: "Blind Cats and Dogs and Fish",
                            address: "1 Cant St. Unit C",
                            city: "Denver",
                            state: "CO",
                            zip: 80111,
                            )
jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
review = shelter_1.reviews.create!(title: "Terrible Service",
                          rating: "2",
                          content: "Manager was very rude and slapped a kitten!",
                          picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                          )
kota = shelter_1.pets.create!(name: "Kota", approximate_age: 3, sex: "Female", image_path: "https://www.insidedogsworld.com/wp-content/uploads/2017/06/German-Shepherd-Standard-Coat-GSC-1000x575-1-1-1-1-1000x575.jpg")
missy = shelter_1.pets.create!(name: "Missy", approximate_age: 4, sex: "Female", image_path: "https://static.fox4news.com/www.fox4news.com/content/uploads/2019/12/6755f591-laughing-horse.jpg")
elon = shelter_2.pets.create!(name: "Elon Musk", approximate_age: 5, sex: "Male", image_path: "https://static.nationalgeographic.co.uk/files/styles/image_3200/public/01-rat-friends-nationalgeographic_1162144.jpg?w=1200&h=800")
grimes = shelter_2.pets.create!(name: "Grimes", approximate_age: 6, sex: "Female", image_path: "https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg")
prince = shelter_2.pets.create!(name: "Prince", approximate_age: 7, sex: "Male", image_path: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg")
cinnamon = shelter_3.pets.create!(name: "Cinnamon", approximate_age: 8, sex: "Female", image_path: "https://thehappypuppysite.com/wp-content/uploads/2018/05/chow-chow-header.jpg")
heidi = shelter_3.pets.create!(name: "Heidi", approximate_age: 9, sex: "Female", image_path: "https://www.bostonherald.com/wp-content/uploads/2020/05/GettyImages-824860820.jpg")
bashful = shelter_3.pets.create!(name: "Bashful", approximate_age: 10, sex: "Female", image_path: "https://thumbs-prod.si-cdn.com/nnJARGtKrLypH4y3Vov2zGTG4xw=/fit-in/1600x0/filters:focal(554x699:555x700)/https://public-media.si-cdn.com/filer/a4/04/a404c799-7118-459a-8de4-89e4a44b124f/img_1317.jpg")
grumpy = shelter_4.pets.create!(name: "Grumpy", approximate_age: 2, sex: "Male", image_path: "https://cdn.mos.cms.futurecdn.net/5FmFtc974AjN255w6iELLj.jpg")
happy = shelter_4.pets.create!(name: "Happy", approximate_age: 3, sex: "Male", image_path: "https://alop.org/wp-content/uploads/2014/12/happy-dog.jpg")
death = shelter_4.pets.create!(name: "Death", approximate_age: 4, sex: "Male", image_path: "https://www.modernmolosser.com/sites/default/files/styles/slideshow/public/field/image/Cane%20Corso%20brindle.jpg?itok=6E0G2Lwz")
zeus = shelter_5.pets.create!(name: "Zeus", approximate_age: 5, sex: "Male", image_path: "https://vetstreet-brightspot.s3.amazonaws.com/04/43/c530807343e5a684b6f0b5eaa4e0/great-dane-ap-1xo5vr-645.jpg")
donner = shelter_5.pets.create!(name: "Donner", approximate_age: 6, sex: "Female", image_path: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234116/Dachshund-MP.jpg")
blitzen = shelter_5.pets.create!(name: "Blitzen", approximate_age: 7, sex: "Male", image_path: "https://vetstreet.brightspotcdn.com/dims4/default/f278f8d/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F4f%2F7556b09ea411e0a2380050568d634f%2Ffile%2FDachshund-5-645mk062311.jpg")
rudolph = shelter_5.pets.create!(name: "Rudolph", approximate_age: 8, sex: "Male", image_path: "https://arc-anglerfish-arc2-prod-bostonglobe.s3.amazonaws.com/public/OKPXEIHXFYI6REFQ7BHTHPSTBU.jpg")
blue_steel = shelter_6.pets.create!(name: "Blue Steel", approximate_age: 1, sex: "Male", image_path: "https://www.veredoptical.com/wp/wp-content/uploads/2013/04/DogGlasses.jpg")
john = shelter_6.pets.create!(name: "John", approximate_age: 10, sex: "Male", image_path: "https://image.freepik.com/free-photo/portrait-white-cat-wearing-glasses_43525-1169.jpg")
goldie = shelter_6.pets.create!(name: "Goldie", approximate_age: 2, sex: "Female", image_path: "https://www.nationalgeographic.com/content/dam/animals/2019/10/goldfish/01-goldfish-nationalgeographic_1567132.jpg")
sam = shelter_6.pets.create!(name: "Sam", approximate_age: 4, sex: "Male", image_path: "https://assets.change.org/photos/8/oe/zx/jROezXlJFNXYtKf-1600x900-noPad.jpg?1550590215")
annie = shelter_6.pets.create!(name: "Annie", approximate_age: 5, sex: "Female", image_path: "https://wallpaperaccess.com/full/1122558.jpg")
granny = shelter_6.pets.create!(name: "Granny", approximate_age: 8, sex: "Female", image_path: "https://images.snapwi.re/4094/5ea10c49ad5a4f26f848f4fd.w800.jpg")
spencer = shelter_6.pets.create!(name: "Spencer", approximate_age: 8, sex: "Male", image_path: "https://images.pexels.com/photos/303357/pexels-photo-303357.jpeg?cs=srgb&dl=pexels-thomas-rendleman-303357.jpg&fm=jpg")
henry = shelter_6.pets.create!(name: "Henry", approximate_age: 8, sex: "Male", image_path: "https://www.selectspecs.com/blog/wp-content/uploads/2016/03/oie_YL8wgHRen1fk-750x410.png")
ben = shelter_6.pets.create!(name: "Ben", approximate_age: 3, sex: "Male", image_path: "https://ak.picdn.net/shutterstock/videos/1007192626/thumb/1.jpg")
shirley = shelter_6.pets.create!(name: "Shirley", approximate_age: 6, sex: "Female", image_path: "https://i.ytimg.com/vi/e3yDayWrTyw/maxresdefault.jpg")
max = shelter_6.pets.create!(name: "Max", approximate_age: 3, sex: "Male", image_path: "https://i.pinimg.com/236x/41/9d/54/419d5479ec3c3d495cefca011277da16--silly-cats-funny-kitties.jpg")
5.times do
  Application.create!(name: "#{Faker::Name.first_name} #{Faker::Artist.name}", address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: 80202, phone_number: Faker::PhoneNumber.cell_phone, description: Faker::Hipster.sentence)
end
