class Report < ApplicationRecord
  belongs_to :booking
  has_rich_text :content
  validates :description, :rating, :booking_id, :date, presence: true
  validates :rating, :inclusion => { :in => (1..10) }
end
