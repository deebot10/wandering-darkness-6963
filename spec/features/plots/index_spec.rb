require 'rails_helper'

RSpec.describe 'Plot Index' do
  before(:each) do
    @garden = Garden.create!(name: 'Dees Orchard', organic: true)

    @plot_1 = @garden.plots.create!(number: 10, size: 'L', direction: 'North')  
    @plot_2 = @garden.plots.create!(number: 25, size: 'M', direction: 'South')  
    @plot_3 = @garden.plots.create!(number: 12, size: 'S', direction: 'East')  

    @plant_1 = @plot_1.plants.create!(name: 'Purple Beauty Sweet Bell Pepper', description: 'Sweet', days_to_harvest: 10)
    @plant_2 = @plot_1.plants.create!(name: 'Dandi Lions', description: 'Colorful', days_to_harvest: 5)
    @plant_3 = @plot_1.plants.create!(name: 'Weeds', description: 'Bitter', days_to_harvest: 8)

    visit plots_path
  end

  describe 'Story1' do
    #     User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots')
    # I see a list of all plot numbers
    # And under each plot number I see names of all that plot's plants
    it 'displays all the plot ids' do
      within("plot-#{@plot_1.id}") do
        expect(page).to have_content(@plot_1.number)
      end

      within("plot-#{@plot_2.id}") do
        expect(page).to have_content(@plot_2.number)
      end

      within("plot-#{@plot_3.id}") do
        expect(page).to have_content(@plot_3.number)
      end
    end

    it 'displays the plot plants' do
      within("plot-#{@plot_1.id}") do
        expect(page).to have_content(@plant_1.name)
      end

      within("plot-#{@plot_2.id}") do
        expect(page).to have_content(@plant_2.name)
      end

      within("plot-#{@plot_3.id}") do
        expect(page).to have_content(@plant_3.name)
      end
    end
  end
end