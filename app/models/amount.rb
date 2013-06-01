class Amount < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :person
  belongs_to :food
end
