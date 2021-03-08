class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :industry, presence: true

  INDUSTRIES = [
    "engineering",
    "marketing",
    "banking & finance",
    "accounting & legal",
    "sports",
    "software development",
    "information technology",
    "education",
    "healthcare",
    "retail",
    "government",
    "construction & maintenance",
    "manufacturing",
    "other"
  ]

  def price_display
    "$#{self.price}/#{self.duration} min"
  end

  def unavailable_dates_params
    bookings.pluck(:start_time, :end_time).map do |start_time, end_time|
      { from: start_time, to: end_time }
    end
  end
end
