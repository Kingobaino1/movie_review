require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before :each do
    @user1 = User.create(full_name: 'John', user_name: 'jon', email: 'john@example.com', password: 'password')
    @opinion = @user1.opinions.create(title: 'Money Heist', content: 'Wow', rating: 4, genre: 'Action')
  end

  scenario 'user can add a comment to an already existing review' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    click_on 'Add Review'
    fill_in 'Add new Comment', with: 'This movie is awesome'
    fill_in 'Rating(1-5)*', with: 3
    click_on 'Comment'
    expect(page).to have_content('Comment added')
  end

  scenario 'user can add a comment to an already existing review' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    click_on 'Add Review'
    fill_in 'Add new Comment', with: ''
    fill_in 'Rating(1-5)*', with: 3
    click_on 'Comment'
    expect(page).to have_content('Comment not added')
  end
end
