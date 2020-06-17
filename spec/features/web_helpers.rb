# frozen_string_literal: true

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in 'Username', with: 'test123'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'test1234'
  fill_in 'Password confirmation', with: 'test1234'
  click_button 'Sign up'
end

def add_post
  click_link 'New post'
  fill_in 'post_message', with: 'Hello, world!'
  click_button 'Submit'
end

def login
  fill_in 'user[login]', with: 'test@example.com'
  fill_in 'Password', with: 'test1234'
  click_button 'Log in'
end
