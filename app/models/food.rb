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
    paid = amounts.detect do |each|
      each.amount >= partial
    end
    not_paid_all  = amounts.detect do |each|
      each.amount < partial
    end

    paid.each do |p|
        p.amount=-partial
        while p.amount > 0
            np = not_paid_all.pop
            debt = Debt.new
            debt.debtor = np.person
            debt.creditor = p.person
            #si es menor que  lo que me deven
            if ((partial - np.amount) < p.amount)
                debt.quantity = partal - np.amount
                p.amount=-partal - np.amount
            #deben mas plata de lo que me tienen que pagar
            else
                debt.quantity = p.amount
                np.amount =+ p.amout
                p.amount = 0 
                not_paid_all.push np unless np.amount == partial
            end
            debt.food = self
            debt.save
        end
    end
  end
end
