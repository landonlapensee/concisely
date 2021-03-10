require 'faker'

puts "Cleaning database..."
Message.destroy_all
Report.destroy_all
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

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
  cities = ["Montréal", "Vancouver", "Victoria", "Banff", "Québec", "Toronto", "Hamilton", "Calgary", "Gatineau", "Kingston", "Regina", "Halifax", "Edmonton", "Winnipeg", "Saskatoon", "Prince Rupert", "White Horse"]
  coaches << User.create!(
    first_name: userhash["name"]["first"],
    last_name: userhash["name"]["last"],
    email: userhash["email"],
    country_code: "CA",
    city: cities.sample,
    bio: "I am an experienced professional.",
    password: "123456",
    image: userhash["picture"]["large"]
  )
end


coaches.each do |user|
  descriptions = [
    "I am an enthusiastic tutor with a lot of interviewing experience. I really want to help out young graduates that are having a hard time going through interviews in the search of a job. I started tutoring interviews on Concisely in the middle of the Covid-19 pandemic after losing my job due to the undetermined closure of the company I am working for. 
    I love giving out the best tools and the best resources to people who are passionated with what they do and motivated to nail their interview to get their dream job. With me, you will be assimilating the best tips, from your verbal to your non-verbal, to have the best interview possible !",
    "When I graduated, I really had a hardtime finding a job, because recruiters were very strict. I remember having a discussion with my grandfather, and he taught me a lot of stuff regarding interviews. As a coach on Concisely, I want to help you just like my grandfather helped me.
    You'll learn how to behave during an interview, how to only talk about what's important and not beat around the bush.",
    "I've been working as the HR director for big companies for years now, and I realized that many people, especially young graduates, were not prepared for interviews. As I have a lot of experience in that domain, I think I am well suited to help people improve their interview skills and nail their interview !
    After the mock up interview, I will talk about everything that was good, and everything to work on. I'll put every small details in the report so you know exactly what to improve and what to keep as it is."
  ]
  prices = [25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]
  Lesson.create!(
    description: descriptions.sample,
    user: user,
    price: prices.sample,
    duration: 30,
    industry: "marketing"
  )
end

#demo student
student = User.create!(bio: "I am a student.",first_name: "Laurier", last_name: "Tsu", email: "s@s.s", password: "123456", country_code: "CA", city: "Montréal", image: "https://www.ldatschool.ca/wp-content/uploads/2015/03/Young-student.jpg")

#demo coach
coach = User.create!(bio: "I am an experienced professional.", first_name: "Larry", last_name: "Lemon", email: "c@c.c", password: "123456", country_code: "CA", city: "Montréal", image: "https://www.pngitem.com/pimgs/m/176-1762843_professional-man-hd-png-download.png")

#demo lesson
lesson = Lesson.create!(
  description: "
  Enthusiastic Human Resources director for Gearify Inc. since 2015, I have a lot of interviewing experience in my bag.
  I used to work as a Human Resources teacher at HEC Montréal from 2006 to 2011 after graduating in Marketing and HR bachelor, and HR Management M.Sc.
  Since the beginning of the Covid-19 pandemic, I saw a lot of young graduates losing motivation towards the research of a job. Indeed, it seems like most companies became more severe and pickier during the interviews. This is the main reason why I decided to join Concisely as a coach in August 2020.
  ",
  user: coach,
  price: 50.00,
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

message1 = Message.create!(
  sender: student,
  recipient: coach,
  content: "Hello"
)

message2 = Message.create!(
  sender: coach,
  recipient: student,
  content: "Hi, how are you doing ?"
)

message2 = Message.create!(
  sender: User.first,
  recipient: student,
  content: "Aloha!"
)

#reports
report1 = Report.create!(
  date: DateTime.strptime("03/02/2021 17:35", "%d/%m/%Y %H:%M"),
  booking: past_booking1,
  content: "
  <div>
    Things That Went Well:<br><br>
  </div>
  <ol>
    <li>&nbsp;You explained pretty well your motivation, and why you want to join the company. Keep it like that, recruiters want to hear that.</li>
    <li>&nbsp;When you talk, I understood right away that were you passionated by Marketing. It's great, because it shows that you are not here by default.</li>
    <li>&nbsp;Great explanation of your background. You went to the point, talked about what's important to say during an interview. You were not beating around the bush </li>
  </ol>
  <div>
    <br>
  </div>
  <div>
    Things To Work On:<br><br>
  </div>
  <ol>
    <li>&nbsp;A lot of hesitation though, which is normal. You've said a lot of 'hmm', but no worries, you can easily work on that. What you can do is to watch the recorded interview that we had and be attentive to all the 'hmm' you said. Hearing yourself trying to fill silence will psychologically work on you.</li>
    <li>&nbsp;Eye contact is very important, and many times you looked in different direction. Good eye contact in an interview shows how interested and appreciative of the recruiter's time. When you do not look the recruiter into the eyes, it can be taken as disrecpectful.</li>
  </ol>
  <div>
    <br>
  </div>
  <div>
    Resources:<br><br>
  </div>
  <ul>
    <li>
      <a href=\"https://www.myinterviewpractice.com/\">https://www.myinterviewpractice.com/</a> -&gt; practice this
    </li>
  </ul>
  <div>
    <br>
  </div>
  <div
    >Additional Comments:<br><br>
  </div>
    <ul>
      <li>I think it would be very important to meet again at least once. Please recontact me in about a week or two, so you have time to practice and work on things to improve. Do not hesitate to fake an interview in front of a miror. It might seem silly but trust me, it works !</li>
    </ul>
  <div>
    <br>
  </div>",
  rating: 7
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
  booking1 = Booking.create!(
    user: student,
    start_time: DateTime.strptime("13/03/2021 17:00", "%d/%m/%Y %H:%M"),
    end_time: DateTime.strptime("13/03/2021 17:30", "%d/%m/%Y %H:%M"),
    lesson: lesson
  )

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

