require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :flowrate }
    it { should validate_numericality_of :flowrate }
  end

  describe 'relationships' do
    it { should have_many :daily_records }
  end
end
