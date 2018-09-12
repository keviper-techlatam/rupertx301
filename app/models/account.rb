class Account < ApplicationRecord
  belongs_to :user
  has_one :contract
  has_many :risk
end
