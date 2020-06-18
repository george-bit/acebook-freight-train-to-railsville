# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Can sign in' do
    User.create(username: 'test1234', email: 'test@example.com', password: 'test1234')
    visit '/login'
    login
    expect(page).to have_content('Signed in as:')
  end

  scenario 'User is forced to sign up with a username' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    click_button 'Sign up'
    expect(page).to have_content("Username can't be blank")
  end

  scenario 'User can click on a username from a search and
  be directed to that profile page' do
    sign_up
    fill_in 'q', with: 'test123'
    click_button 'Search'
    click_link 'test123'
    expect(page).to have_content('test123')
  end
end
