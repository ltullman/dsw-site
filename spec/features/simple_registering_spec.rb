require 'spec_helper'

feature 'Registering to attend (via kiosk)' do
  before do
    visit '/enable-simple-reg'
  end

  before do
    travel_to AnnualSchedule.current.registration_open_at.to_datetime + 1.day
  end

  after do
    visit '/disable-simple-reg'
  end

  let!(:track) do
    create :track, name: 'Founder',
                   is_submittable: true
  end


  scenario 'Registering to attend' do
    visit '/'
    click_link 'Schedule / Register'
    click_link 'Register Now'
    fill_in 'What is your name?', with: 'Test Registrant'
    fill_in 'What is your e-mail address?', with: 'test2@example.com'
    select 'he/him/his', from: 'registration_gender'
    select '25-34 years old', from: 'registration_age_range'
    select 'Founder', from: 'registration_track_id'
    fill_in 'registration_company_name', with: 'Example.com'
    fill_in 'registration_primary_role', with: 'Developer'
    fill_in 'registration_zip', with: '12345'
    click_button 'Register'
    expect(page).to have_content('Thanks for registering')
    expect(current_path).to include('/schedule')
    user = User.where(email: 'test2@example.com').first!
    expect(user.name).to eq('Test Registrant')
    expect(user.current_registration.company.name).to eq('Example.com')
    expect(user.current_registration.primary_role).to eq('Developer')
  end

  scenario 'Registering to attend with a preexisting account' do
    user = User.create!(email: 'test2@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 name: 'Preexisting Registrant')
    visit '/'
    click_link 'Schedule / Register'
    click_link 'Register Now'
    fill_in 'What is your name?', with: 'Test Registrant'
    fill_in 'What is your e-mail address?', with: 'test2@example.com'
    select 'he/him/his', from: 'registration_gender'
    select '25-34 years old', from: 'registration_age_range'
    select 'Founder', from: 'registration_track_id'
    fill_in 'registration_company_name', with: 'Example.com'
    fill_in 'registration_primary_role', with: 'Developer'
    fill_in 'registration_zip', with: '12345'
    click_button 'Register'
    expect(page).to have_content('Thanks for registering')
    expect(current_path).to include('/schedule')
    expect(user.reload.name).to eq('Preexisting Registrant')
    expect(user.current_registration.company.name).to eq('Example.com')
    expect(user.current_registration.primary_role).to eq('Developer')
  end
end
