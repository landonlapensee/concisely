class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_one :review
  has_one :payment
  has_one :report
  validates :user, presence: true
  validates :lesson, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
