class Report < ApplicationRecord
  belongs_to :booking

  validates :description, :rating, :booking_id, :date, presence: true
  validates :rating, :inclusion => { :in => (1..10) }
end
