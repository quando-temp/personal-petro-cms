class Customer < ApplicationRecord
  has_many :petros, :dependent => :destroy 
  accepts_nested_attributes_for :petros, :allow_destroy => true
end
