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

  def duration=(minutes)
    return nil if start_time.nil?

    self.end_time = start_time + minutes.to_i.minutes
  end

  def duration
    if start_time.nil? || end_time.nil?
      nil
    else
      (end_time - start_time) / 60
    end
  end

  # def available_durations
  #   [20, 40, 60]
  # end
end
