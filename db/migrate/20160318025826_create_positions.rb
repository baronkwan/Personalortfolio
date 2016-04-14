class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.belongs_to :portfolio, index: true
      t.belongs_to :stock, index: true
      t.integer :quantity
      t.decimal :price

      t.timestamps null: false
    end
  end
end
