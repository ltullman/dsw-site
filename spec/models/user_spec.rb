require 'spec_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:submissions).dependent(:restrict_with_error) }
  it { is_expected.to have_many(:votes).dependent(:destroy) }
  it { is_expected.to have_many(:registrations).dependent(:destroy) }
  it { is_expected.to have_many(:pitch_contest_votes).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to allow_value(0).for(:team_priority) }
  it { is_expected.to allow_value(10).for(:team_priority) }
  it { is_expected.to allow_value(5).for(:team_priority) }
  it { is_expected.to allow_value(nil).for(:team_priority) }
  it { is_expected.not_to allow_value(-1).for(:team_priority) }
  it { is_expected.not_to allow_value(100).for(:team_priority) }

  describe 'with a subject record present' do
    subject { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
