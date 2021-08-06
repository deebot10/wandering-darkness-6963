class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plotted_plants
  has_many :plants, through: :plotted_plants
end
