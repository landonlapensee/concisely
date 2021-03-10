class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :coach_listed_bookings, through: :lessons, source: :bookings
  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
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

    def upcoming_bookings
      # Filter by end_time. Everything after NOW
      coach_bookings = coach_listed_booking_ids.map do |booking_id|
        Booking.where(id: booking_id).where("end_time >= ?", Time.now)
      end

      filtered_bookings = bookings.select { |booking| booking.end_time >= Time.now }

      upcoming_bookings = (filtered_bookings + coach_bookings).sort { |booking| booking.end_time }
      # reminder of Caio <3
      # bookings.or(Booking.where(id: coach_listed_bookings)).where("end_time >= ?", Time.current).order(end_time: :asc).first
    end

    def past_bookings
      # Filter by end_time. Everything after NOW
      coach_bookings = coach_listed_booking_ids.map do |booking_id|
        Booking.where(id: booking_id).where("end_time <= ?", Time.now)
      end

      filtered_bookings = bookings.select do |booking|
        booking.end_time <= Time.now 
      end

      past_bookings = (filtered_bookings + coach_bookings).sort { |booking| booking.end_time }
      
    end
    def conversation_users
      ids = messages.pluck(:recipient_id, :sender_id).flatten.uniq
      ids.delete(id)
      User.find(ids)
    end

    def messages
      sent_messages.or(received_messages)
    end

    def messages_with(user)
      messages.where(recipient: user).or(messages.where(sender: user))
    end

    def all_reports
      bookings.map do |booking|
        unless booking.report.nil?
          booking.report
        end
      end
    end
end
