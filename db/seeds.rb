require 'faker'

puts "Cleaning database..."
User.destroy_all
# Lesson.destroy_all
# Booking.destroy_all
# Report.destroy_all



#Coaches
coaches = []
emails = ["a@a.a", "b@b.b", "c@c.c", "d@d.d", "e@e.e", "f@f.f", "g@g.g", "h@h.h", "i@i.i"]
emails.each do |email|
  coaches << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: email,
    password: "123456"
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

#student
student = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "s@s.s", password: "123456")

#future bookings
booking1 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("09/03/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

booking2 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("16/03/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

booking3 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("23/03/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

booking4 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("09/01/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

booking5 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("16/01/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

booking6 = Booking.create!(
  user: student,
  start_time: DateTime.strptime("23/01/2021 17:00", "%d/%m/%Y %H:%M"),
  lesson: Lesson.all.sample
)

#reports
report1 = Report.create!(
  date: DateTime.strptime("09/03/2021 20:00", "%d/%m/%Y %H:%M"),
  booking: booking1,
  description: "Very good job !",
  rating: 5
)

report2 = Report.create!(
  date: DateTime.strptime("16/03/2021 20:00", "%d/%m/%Y %H:%M"),
  booking: booking2,
  description: "Very good job !",
  rating: 5
)

report3 = Report.create!(
  date: DateTime.strptime("23/03/2021 20:00", "%d/%m/%Y %H:%M"),
  booking: booking3,
  description: "Very good job !",
  rating: 5
)
