class User < ApplicationRecord
  extend FriendlyId
  # Original Plan
  # User has a portfolio they can send to people from the site
  # User can upload new projects to their portfolio and have a page displaying their work, about them, contact info, whatever they want
  # Portfolio will be by user, ex. portfoliyours.com/evan-pavone/portfolio <-- this is the goal
  # A Portfolio or Project can have comments and like status
  # Top Portfolios will be on the Home Page
  # Other users can become "fans" of that users portfolio and be updated with new updates/projects of the favorable user via text/email
  # Permissions are a seperate model but belong to user. The Admin or a Role can assign permissions to a user. All users get permissions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  
  # Role
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?
  #has_many :fans

  friendly_id :portfolioslug, use: %i[slugged finders]

  def self.ransackable_attributes(auth_object = nil)
    ["email", "first_name", "last_name", "role", "username"]
  end


  # Friendly Id
  def portfolioslug
    "#{first_name}-#{last_name}"
  end

  def should_generate_new_friendly_id?
    last_name_changed? || slug.blank?
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
