require 'rails_helper'

RSpec.feature 'Opinions', type: :feature do
  before :each do
    @user1 = User.create(full_name: 'John', user_name: 'jon', email: 'john@example.com', password: 'password')
    @user2 = User.create(full_name: 'Odogwu', user_name: 'nwa', email: 'odogwu@example.com', password: 'password')
    @user3 = User.create(full_name: 'Harry', user_name: 'potter', email: 'harry@example.com', password: 'password')
    @user2.opinions.create(title: 'Money Heist', content: 'Wow', rating: 4, genre: 'Action')
  end

  scenario 'user can write a review' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    fill_in 'Add movie title *', with: 'Three idiots'
    fill_in 'Write a review... *', with: 'This movie is dope'
    fill_in 'Rating(1-5) *', with: 3
    select 'Action', from: 'Genre'
    click_on 'Submit'
    expect(page).to have_content('Review created!')
  end

  scenario 'user can see other users reviews' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('1 Review')
  end
end
