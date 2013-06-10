class Debt < ActiveRecord::Base
  belongs_to :debtor, :class_name => "Person"
  belongs_to :creditor, :class_name => "Person"
  belongs_to :food
  attr_accessible :name, :quantity

  scope :debtors, lambda { |person_id| where("debtor_id = ?", person_id ) }
  scope :creditors, lambda { |person_id| where("creditor_id = ?", person_id ) }
end
