class Account < ApplicationRecord
  belongs_to :user
  has_one :contract
  has_many :account_risk
end
