require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do 
    it { should have_many :plotted_plants}
    it { should have_many(:plots).through(:plotted_plants)}
  end
end