class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots 

  def harvest
    #Joins
    # Plant.joins(:plots).select('plants.name').where('days_to_harvest < ?', 100)
    # .distinct.pluck(:name)  
    #Through assoications
    plants.select('plants.name').where('days_to_harvest < ?', 100).distinct.pluck(:name)  
  end
end
