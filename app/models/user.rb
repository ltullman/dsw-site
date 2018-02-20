class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :validatable

  default_scope { order('LOWER(name) ASC') }

  validates :name, presence: true

  validates :team_priority,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, allow_nil: true }

  has_many :submissions, foreign_key: 'submitter_id', dependent: :restrict_with_error
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :pitch_contest_votes, class_name: 'PitchContest::Vote', dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.on_team
    reorder('team_priority ASC, team_position DESC, name DESC').where.not(team_position: nil)
  end

  def current_registration
    registrations.for_current_year.first
  end

  def registered?
    current_registration.present?
  end
end
