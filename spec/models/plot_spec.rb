require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many :plotted_plants}
    it { should have_many(:plants).through(:plotted_plants)}
  end
end
