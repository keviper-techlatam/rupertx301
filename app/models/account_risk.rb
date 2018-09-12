class AccountRisk < ApplicationRecord
  belongs_to :account
  belongs_to :risk
end
