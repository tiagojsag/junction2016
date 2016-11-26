AdminUser.delete_all
ParkingPlace.delete_all
TimeSlot.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


def rand_time(from, to)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

for i in 0..100
  parking_place = ParkingPlace.create!(title: "Parking place #{i}",
                       description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse maximus nibh et libero tempus, et mattis quam blandit',
                       latitude: Random.rand(-85..85),
                       longitude: Random.rand(-180..180)
  )

  end_time = 10.days.ago
  for i in 0..5
    start_time = rand_time(end_time, end_time + 10.days)
    end_time = rand_time(start_time, start_time + rand(1..30).days)
    TimeSlot.create!(
        parking_place:parking_place,
        start_time: start_time,
        end_time: rand_time(start_time, start_time + rand(1..30).days),
        price_hour: rand(4..10),
        price_day: rand(40..100)
    )
  end
end
