class Project < ApplicationRecord
  validates :title, presence: true
  has_rich_text :description
  belongs_to :user
  has_many :comments, dependent: :destroy
end
