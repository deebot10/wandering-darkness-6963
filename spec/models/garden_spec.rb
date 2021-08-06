require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots)}
  end

  before(:each) do
    @garden = Garden.create!(name: 'Dees Orchard', organic: true)

    @plot_1 = @garden.plots.create!(number: 10, size: 'L', direction: 'North')  
    @plot_2 = @garden.plots.create!(number: 25, size: 'M', direction: 'South')  
    @plot_3 = @garden.plots.create!(number: 12, size: 'S', direction: 'East')  

    @plant_1 = @plot_1.plants.create!(name: 'Purple Beauty Sweet Bell Pepper', description: 'Sweet', days_to_harvest: 70)
    @plant_2 = @plot_2.plants.create!(name: 'Dandi Lions', description: 'Colorful', days_to_harvest: 50)
    @plant_3 = @plot_3.plants.create!(name: 'Weeds', description: 'Bitter', days_to_harvest: 8)
    @plant_4 = @plot_3.plants.create!(name: 'Strawberries', description: 'Bitter', days_to_harvest: 100)
    @plant_5 = @plot_1.plants.create!(name: 'Purple Beauty Sweet Bell Pepper', description: 'Sweet', days_to_harvest: 70)
  end

  describe 'instance methods' do
    describe '#harvest' do
      it 'displays a unique list of plants and only includes plants that take less than 100 days to harvest' do
        expect(@garden.harvest).to eq(["Dandi Lions", "Purple Beauty Sweet Bell Pepper", "Weeds"])
      end
    end
  end
end
