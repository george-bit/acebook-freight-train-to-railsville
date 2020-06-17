# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Can sign in' do
    User.create(username: 'test1234', email: 'test@example.com', password: 'test1234')
    visit '/login'
    login
    expect(page).to have_content('Signed in as:')
  end
end
