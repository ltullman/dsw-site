require 'spec_helper'

feature 'Editing my profile' do

  before do
    allow(ListSubscriptionJob).to receive(:perform_async)
  end

  scenario 'Creating an editing an account from the dashboard' do
    visit '/dashboard'
    click_link 'Create an account'
    fill_in 'Name', with: 'Test Registrant'
    fill_in 'E-mail Address', with: 'test2@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'
    click_link 'My Profile'
    fill_in 'Name', with: 'Test Registrant 2'
    fill_in 'Tagline', with: 'Founder at Pied Piper'
    fill_in 'user_current_password', with: 'password'
    click_button 'Update'
    expect(page).to have_field('Name', with: 'Test Registrant 2')
    expect(page).to have_field('Tagline', with: 'Founder at Pied Piper')
  end
end
