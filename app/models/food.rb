class Food < ActiveRecord::Base
  attr_accessible :name
  has_many :amount

  def add_person(person, quantity)
      amount = Amount.new
      amount.person = person
      amount.amount = quantity
      amount.food   = self
      amount.save()
  end
end
