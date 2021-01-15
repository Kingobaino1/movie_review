# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user1 = User.create(full_name: 'John', user_name: 'jon', email: 'john@example.com', password: 'password')
    @user2 = User.create(full_name: 'Odogwu', user_name: 'nwa', email: 'odogwu@example.com', password: 'password')
    @user3 = User.create(full_name: 'Harry', user_name: 'potter', email: 'harry@example.com', password: 'password')
  end
  scenario 'User can sign in and sign out' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_on 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'Invalid user inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'passwords'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'invalid inputs for user sign up' do
    visit new_user_registration_path
    fill_in 'Full name', with: ''
    fill_in 'User name', with: 'jacky'
    fill_in 'Email', with: 'jim@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
    expect(page).to have_content('1 error prohibited this user from being saved:')
  end

  scenario 'valid inputs for user sign up' do
    visit new_user_registration_path
    fill_in 'Full name', with: 'John'
    fill_in 'User name', with: 'John'
    fill_in 'Email', with: 'hello@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'user can follow and unfollower other users' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit user_path(@user3)
    click_on 'Follow'
    expect(page).to have_content("You are now following #{@user3.full_name}")
    click_on 'Unfollow'
    expect(page).to have_content("You are no longer following #{@user3.full_name}")
  end
end

# rubocop:enable Metrics/BlockLength
