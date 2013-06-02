class Debt < ActiveRecord::Base
  belongs_to :debtor, :class_name => "Person"
  belongs_to :creditor, :class_name => "Person"
  belongs_to :food
  attr_accessible :name, :quantity
end