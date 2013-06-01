class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.references :person
      t.references :food
      t.decimal :amount

      t.timestamps
    end
  end
end
