class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  # has_one :review, dependent: :destroy
  # has_one :payment, dependent: :destroy
  has_one :report, dependent: :destroy
  validates :user, presence: true
  validates :lesson, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :for, -> (date) { where("start_time BETWEEN ? AND ?", date.all_day.min, date.all_day.max) }

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
