class Food < ActiveRecord::Base
  attr_accessible :name
  has_many :amounts

  def add_person(person, quantity)
      amount = Amount.new
      amount.person = person
      amount.amount = quantity
      amount.food   = self
      amount.save()
  end
  def total
    sum = 0
    amounts.each  do |a|
        sum+=a.amount
    end
    sum
  end
  def close
    partial = total / amounts.count
    paid_group = amounts.where('amount >= ?',partial)
    not_paid_all_group  = amounts.where('amount < ?',partial)
    paid_group.each do |amount|
        owed = amount.amount - partial
        while owed > 0 do
            not_paid_all = not_paid_all_group.pop
            owes = partial - not_paid_all.amount
            debt = Debt.new
            debt.debtor = not_paid_all.person
            debt.creditor = amount.person
            debt.food = self
            #si es menor que  lo que me deben
            if (owes < owed)
                debt.quantity = owes
                owed -= owes
            #deben mas plata de lo que me tienen que pagar
            else
                debt.quantity = owed
                not_paid_all.amount -= owed
                owed = 0
                not_paid_all_group.push(not_paid_all) unless not_paid_all.amount == partial
            end
            debt.save
        end
    end
  end
end

