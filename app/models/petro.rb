class Petro < ApplicationRecord
  has_many :calltimes
  belongs_to :customer
end
