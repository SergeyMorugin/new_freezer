class Category < ApplicationRecord
  has_many :items
  extend FriendlyId
  friendly_id :title
end