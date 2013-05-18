class CreateCuantos < ActiveRecord::Migration
  def change
    create_table :cuantos do |t|
      t.integer :canitdad
      t.references :persona
      t.references :food

      t.timestamps
    end
    add_index :cuantos, :persona_id
    add_index :cuantos, :food_id
  end
end
