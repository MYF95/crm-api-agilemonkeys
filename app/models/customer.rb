class Customer < ApplicationRecord
  has_one_attached :avatar

  validates_presence_of :name, :surname
end
