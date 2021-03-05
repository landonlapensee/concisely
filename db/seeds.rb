require 'faker'

puts "Cleaning database..."
User.destroy_all
# Lesson.destroy_all
# Booking.destroy_all
# Report.destroy_all

# scraping
# users = 100.times.map { JSON.parse(HTTParty.get("https://randomuser.me/api/").body)["results"].first }
# storing
# File.open("users.yml", "wb") { |file| file << users.to_yaml }
# parsing
users = YAML.load_file('db/support/users.yml')
# user = users.first
# user["email"]

coaches = []

users.each do |userhash|
  coaches << User.create!(
    first_name: userhash["name"]["first"],
    last_name: userhash["name"]["last"],
    email: userhash["email"],
    country_code: "CA",
    city: "Vancouver",
    bio: "I am an experienced professional.",
    password: "123456",
    image: userhash["picture"]["large"]
  )
end

coaches.each do |user|
  Lesson.create!(
    description: "Hi there I am enthusiastic professional with lots of interviewing experience. I can train you how to perform at your best under pressure! My lesson's are 20 minutes that includes a 15 minute mock up interview and 5 minutes of feedback.",
    user: user,
    price: 40.00,
    duration: 30,
    industry: "marketing"
  )
end

#demo student
student = User.create!(first_name: "Laurier", last_name: "Tsu", email: "s@s.s", password: "123456", image: "https://randomuser.me/api/portraits/men/34.jpg")

#demo coach
coach = User.create!(first_name: "Larry", last_name: "Lemon", email: "c@c.c", password: "123456", image: "https://randomuser.me/api/portraits/men/34.jpg")

#demo lesson
lesson = Lesson.create!(
  description: "Hi there I am enthusiastic professional with lots of interviewing experience. I can train you how to perform at your best under pressure! My lesson's are 20 minutes that includes a 15 minute mock up interview and 5 minutes of feedback.",
  user: coach,
  price: 40.00,
  duration: 30,
  industry: "marketing"
  )
  
  #demo bookings
past_booking1 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("03/02/2021 17:00", "%d/%m/%Y %H:%M"),
  end_time: DateTime.strptime("03/02/2021 17:30", "%d/%m/%Y %H:%M"),
  lesson: lesson,
  price: lesson.price
  )

past_booking2 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("03/03/2021 17:00", "%d/%m/%Y %H:%M"),
  end_time: DateTime.strptime("03/03/2021 17:30", "%d/%m/%Y %H:%M"),
  lesson: lesson,
  price: lesson.price
  )
  
  #future bookings
  future_booking = Booking.create!(
    user: student,
    start_time: DateTime.strptime("09/03/2021 17:00", "%d/%m/%Y %H:%M"),
    end_time: DateTime.strptime("09/03/2021 17:30", "%d/%m/%Y %H:%M"),
    lesson: lesson,
    price: lesson.price 
    )
    
  #reports
  report1 = Report.create!(
    date: DateTime.strptime("03/02/2021 17:35", "%d/%m/%Y %H:%M"),
    booking: past_booking1,
    content: "<div>Things That Went Well:<br><br></div><ol><li>&nbsp;You did this well</li><li>&nbsp;You did this well</li><li>&nbsp;You did this well</li></ol><div><br></div><div>Things To Work On:<br><br></div><ol><li>&nbsp;Work on this</li><li>&nbsp;Work on this</li><li>&nbsp;Work on this</li></ol><div><br></div><div>Resources:<br><br></div><ul><li><a href=\"https://www.myinterviewpractice.com/\">https://www.myinterviewpractice.com/</a> -&gt; practice this</li></ul><div><br></div><div>Additional Comments:<br><br></div><ul><li>Lets meet again next week</li></ul><div><br></div>",
    rating: 5
    )
          
  # report2 = Report.create!(
  #   date: DateTime.strptime("16/01/2021 20:00", "%d/%m/%Y %H:%M"),
  #   booking: booking2,
  #   description: "Very good job !",
  #   rating: 5
  # )
  
  # report3 = Report.create!(
  #   date: DateTime.strptime("23/01/2021 20:00", "%d/%m/%Y %H:%M"),
  #   booking: booking3,
  #   description: "Very good job !",
  #   rating: 5
  # )
    
#future bookings
# booking1 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("09/03/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("09/03/2021 17:30", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

# booking2 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("16/03/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("16/03/2021 18:00", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

# booking3 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("23/03/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("23/03/2021 18:00", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

# #past bookings
# booking4 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("09/01/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("09/01/2021 18:00", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

# booking5 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("16/01/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("16/01/2021 18:00", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

# booking6 = Booking.create!(
#   user: student,
#   start_time: DateTime.strptime("23/01/2021 17:00", "%d/%m/%Y %H:%M"),
#   end_time: DateTime.strptime("23/01/2021 18:00", "%d/%m/%Y %H:%M"),
#   lesson: Lesson.all.sample
# )

#Coaches
# coaches = []
# emails = ["a@a.a", "b@b.b", "c@c.c", "d@d.d", "e@e.e", "f@f.f", "g@g.g", "h@h.h", "i@i.i"]
# emails.each do |email|
#   coaches << User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: email,
#     password: "123456",
#     image: "https://randomuser.me/api/portraits/men/34.jpg"
#   )
# end 
      
