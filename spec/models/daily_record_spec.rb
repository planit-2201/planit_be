require 'rails_helper'

RSpec.describe DailyRecord, type: :model do
  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_numericality_of :bag_count }
    it { should validate_numericality_of :container_count }
    it { should validate_numericality_of :straw_count }
    it { should validate_numericality_of :shower_time }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
