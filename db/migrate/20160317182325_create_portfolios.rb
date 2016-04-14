class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.belongs_to :owner, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
