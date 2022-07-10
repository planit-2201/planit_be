class User < ApplicationRecord
  validates_presence_of :username, :flowrate

  validates_numericality_of :flowrate

  has_many :daily_records, foreign_key: :user_id, dependent: :destroy
end
