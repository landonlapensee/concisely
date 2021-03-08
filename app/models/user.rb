class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :coach_listed_bookings, through: :lessons, source: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def can_create_a_report_for?(booking)
      self == booking.lesson.user_id
    end

    def has_made_a_booking?
      self.bookings.first
    end

    def is_a_coach?
      # this will need to be changed eventually when we have a coach vetting system
      self.lessons.first
    end

    def country_name
      ISO3166::Country[country_code]&.name
    end

    def country_flag
      country_code.tr('A-Z', "\u{1F1E6}-\u{1F1FF}")
    end

    def next_meeting_booking
      bookings.or(Booking.where(id: coach_listed_bookings)).where("end_time > ?", Time.current).order(end_time: :asc).first
    end
end
