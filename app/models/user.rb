class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def can_create_a_report_for?(booking)
      self == booking.lesson.user_id
    end

    def has_made_a_booking?
      self.bookings.first
    end

    def is_a_coach?
      self.lessons.first
    end
end
