class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: :event_attended_id
  has_many :attendees, through: :attendances, source: :attendee
  has_many :invites
  has_many :invitees, through: :invites, source: :invitee

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }

  def formatted_date
    date.to_time.strftime('%B %e, %Y')
  end

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date.present? && date < Time.now
  end
end