class Project < ApplicationRecord
  validates :title, presence: true
  has_rich_text :description
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
end
