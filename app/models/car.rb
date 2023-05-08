class Car < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end