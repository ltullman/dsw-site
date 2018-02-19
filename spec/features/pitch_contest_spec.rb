require 'spec_helper'

feature 'Submitting and voting on pitch contest applications' do

  let!(:user) do
    create(:user, email: 'test@example.com', password: 'password')
  end

  let!(:track) do
    create(:track, name: 'Founder',
                   is_submittable: true)
  end

  let!(:pitch) do
    PitchContest::Entry.create!(name: 'Globex Corporation',
                                video_url: 'https://youtu.be/oruC0LSuYgM',
                                year: AnnualSchedule.current.year)
  end

  describe 'when voting is open' do
    before do
      travel_to AnnualSchedule.current.pitch_voting_open_at.to_datetime + 1.day
    end

    scenario 'User votes for an entry when already signed in' do
      login_as user, scope: :user
      visit '/pitch'
      click_link 'Vote Now'
      expect(page).to have_content('Globex Corporation')

      click_link "Vote for 'Globex Corporation'"
      expect(page).to have_css('.vote-count', text: '1 vote')

      # Clicking twice should have no effect
      click_link "Vote for 'Globex Corporation'"
      expect(page).to have_css('.vote-count', text: '1 vote')
    end

    scenario 'User votes for a session after being prompted to sign in' do
      visit '/pitch'
      click_link 'Vote Now'
      expect(page).to have_content('Globex Corporation')

      click_link "Vote for 'Globex Corporation'"
      fill_in 'E-mail Address', with: 'test@example.com'
      fill_in 'Password', with: 'password', match: :prefer_exact
      click_button 'Sign In'

      click_link "Vote for 'Globex Corporation'"
      expect(page).to have_css('.vote-count', text: '1 vote')

      # Clicking twice should have no effect
      click_link "Vote for 'Globex Corporation'"
      expect(page).to have_css('.vote-count', text: '1 vote')
    end
  end

  describe 'when voting is closed' do
    before do
      travel_to AnnualSchedule.current.pitch_application_close_at.to_datetime + 1.day
    end

    scenario 'User tries to access voting when feedback is closed' do
      visit '/pitch'
      expect(page).not_to have_content('Vote Now')
    end
  end

end
