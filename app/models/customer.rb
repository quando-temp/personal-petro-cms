class Customer < ApplicationRecord
  enum type_customer: ['Thường xuyên', 'Không thường xuyên']
  has_many :petros, -> { order "day_fuel DESC" }, :dependent => :destroy
  has_many :day_fuel_petros, :dependent => :destroy, class_name: 'Petro'
  has_one :petro, -> { order "id DESC" }, class_name: 'Petro'
  accepts_nested_attributes_for :day_fuel_petros, :allow_destroy => true
  
  validates :name, 
    length: { 
      in: 4..30,
      too_short: "Tên nhập quá ngắn, phải có ít nhất 4 kí tự trở lên.",
      too_long: "Tên nhập quá dài, dưới 30 kí tự." }

  validates :phone, 
    length: { 
      in: 9..12,
      too_short: "SĐT nhập quá ngắn, phải có ít nhất 9 kí tự trở lên.",
      too_long: "SĐT nhập quá dài, dưới 12 kí tự."},
    numericality: { 
      only_integer: true,
      message: "Yêu cầu nhập các kí tự là số" }

  validates :car_number, uniqueness: true
end
