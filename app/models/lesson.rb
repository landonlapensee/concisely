class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :industry, presence: true

  INDUSTRIES = [
    "Engineering",
    "Marketing",
    "Web Development",
    "Banking & Finance",
    "Accounting & Legal",
    "Sports",
    "Software Development",
    "Information Technology",
    "Education",
    "Healthcare",
    "Retail",
    "Government",
    "Construction & Maintenance",
    "Manufacturing",
    "Other"
  ]

  def price_display
    "$#{self.price} / lesson"
  end

  def available_hours_for(date)
    hours_for_booking(date).reject do |time|
      booked_times_for(date).include?(time)
    end
  end

  def available_hours_params_for(date)
    available_hours_for(date).map do |hour_options|
      ["#{hour_options.strftime("%H:%M")}", hour_options]
    end
  end

  private

  def booked_times_for(date)
    bookings
      .for(date)
      .pluck(:start_time)
      .map(&:to_datetime)
  end

  def slots_count_possible_per_day
    (12 * 60).minutes / duration.minutes
  end

  def hours_for_booking(date)
    slots_count_possible_per_day.floor.times.map do |n|
      (beginning_of_work_day(date) + (n * duration.minutes)).to_datetime
    end
  end

  def beginning_of_work_day(date)
    date.beginning_of_day + 9.hours
  end
end
