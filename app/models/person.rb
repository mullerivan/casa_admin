class Person < ActiveRecord::Base
  attr_accessible :name
  has_many :amounts
  has_many :debts
end
