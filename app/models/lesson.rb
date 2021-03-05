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
    "$#{lesson.price}/#{lesson.duration} min"
  end
end
