# frozen_string_literal: true

# post class
class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user, required: false
end
