class Petro < ApplicationRecord
  has_many :calltimes
  belongs_to :customer

  after_save :update_customer

  private
    def update_customer
      customer = self.customer
      customer.update(last_date_petro: customer.petros[0].day_fuel)
    end
end
