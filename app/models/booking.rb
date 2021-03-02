class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :review
  belongs_to :payment
  belongs_to :report
end
