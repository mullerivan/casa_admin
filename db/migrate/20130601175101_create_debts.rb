class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :name
      t.references :debtor
      t.references :creditor
      t.references :food
      t.decimal :quantity

      t.timestamps
    end
    add_index :debts, :debtor_id
    add_index :debts, :creditor_id
    add_index :debts, :food_id
  end
end
