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

  has_many :submissions, foreign_key: 'submitter_id', dependent: :restrict_with_error
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :pitch_contest_votes, class_name: 'PitchContest::Vote', dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.on_team
    where.not(team_position: nil)
  end

  def current_registration
    registrations.for_current_year.first
  end

  def registered?
    current_registration.present?
  end
end
