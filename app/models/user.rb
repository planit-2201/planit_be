class User < ApplicationRecord
  has_many :daily_records, dependent: :destroy
end
