class CallsController < ApplicationController
  def index
    @usually_customers = Customer.where(type_customer: 0).where.not(id: [Customer.joins(:petros).where("petros.day_fuel > ?", 5.days.ago).ids])
    @rarely_customers = Customer.where(type_customer: 1).where.not(id: [Customer.joins(:petros).where("petros.day_fuel > ?", 15.days.ago).ids])
  end
end
