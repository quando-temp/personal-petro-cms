class CallsController < ApplicationController
  def index
    @usually_customers = Petro.joins(:customer).select(:id, :customer_id, :day_fuel).where('type_customer = 0 && day_fuel < ?', 5.days.ago).order(:customer_id, :day_fuel).to_a.uniq(&:customer_id)
    @rarely_customers = Petro.joins(:customer).select(:id, :customer_id, :day_fuel).where('type_customer = 1 && day_fuel < ?', 15.days.ago).order(:customer_id, :day_fuel).to_a.uniq(&:customer_id)
  end
end
