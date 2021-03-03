require 'faker'

puts "Cleaning database..."
User.destroy_all
Lesson.destroy_all


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
    industry: "marketing"
  )
end

#student
student = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "s@s.s", password: "123456")
