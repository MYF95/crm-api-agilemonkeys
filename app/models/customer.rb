class Customer < ApplicationRecord
  validates_presence_of :name, :surname, :created_by, :updated_by
end
