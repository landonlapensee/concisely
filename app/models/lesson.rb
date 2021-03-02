class Lesson < ApplicationRecord
  belongs_to :user
  validates :category, presence: true

  CATEGORIES = [
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
end
