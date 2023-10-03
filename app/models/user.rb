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
  has_one_attached :avatar
  friendly_id :portfolioslug, use: %i[slugged finders]

  # Class level accessor http://apidock.com/rails/Class/cattr_accessor
  cattr_accessor :form_steps do
    %w[sign_up set_name set_social find_users]
  end

  # Instance level accessor http://apidock.com/ruby/Module/attr_accessor
  attr_accessor :form_step

  def form_step
    @form_step ||= 'sign_up'
  end

  # Step 1
  with_options if: -> { required_for_step?('set_name') } do |step|
    step.validates :first_name, presence: true
    step.validates :last_name, presence: true
    step.validates :country, presence: true
  end

  def required_for_step?(step)
    # All fields are required if no form step is present
    form_step.nil?

    # All fields from previous steps are required if the
    # step param appears before or we are on the current step
    form_steps.index(step.to_s) <= form_steps.index(form_step.to_s)
  end

  # Step 3
  

  def self.ransackable_attributes(auth_object = nil)
    ["email", "first_name", "last_name", "role"]
  end

  def full_name
    "#{first_name.capitalize unless first_name.nil?} #{last_name.capitalize unless last_name.nil?}"
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
