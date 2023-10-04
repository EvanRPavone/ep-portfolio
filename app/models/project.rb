class Project < ApplicationRecord
  extend FriendlyId
  validates :title, presence: true

  has_rich_text :description

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  has_many_attached :screenshots

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "github", "id", "title", "updated_at", "user_id", "views", "website", "youtube"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments", "notifications", "rich_text_description", "user"]
  end

  def screenshot(image)
    if image.present?
      image
    else
      'default.jpg'
    end
  end
end
