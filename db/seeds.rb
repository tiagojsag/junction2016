# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.delete_all
ParkingPlace.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

for i in 0..100
  ParkingPlace.create!(title: "Parking place #{i}",
                       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse maximus nibh et libero tempus, et mattis quam blandit',
                       latitude: Random.rand(-85..85),
                       longitude: Random.rand(-180..180)
  )
end
