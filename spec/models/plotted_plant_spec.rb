require 'rails_helper'

RSpec.describe PlottedPlants do
  describe 'relationships' do
    it { should belong_to :plant}
    it { should belong_to :plot}
  end
end