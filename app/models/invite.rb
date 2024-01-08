class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :invitee, class_name: 'User'

  validates :event, presence: true
  validates :invitee, presence: true
end
