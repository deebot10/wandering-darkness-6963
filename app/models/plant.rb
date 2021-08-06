class Plant < ApplicationRecord
  has_many :plotted_plants
  has_many :plots, through: :plotted_plants
end