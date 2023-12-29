class Destination < ApplicationRecord
  validates :name, presence: true
  validates :zip, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
