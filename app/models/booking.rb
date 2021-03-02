class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_one :review
  has_one :payment
  has_one :report
end
