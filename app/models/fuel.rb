class Fuel < ApplicationRecord
  validates :name, presence: { message: "Yêu cầu nhập tên của nhiên liệu" }
  validates :price, 
    numericality: { 
      only_integer: true,
      message: "Yêu cầu nhập giá tiền là số" }
end
