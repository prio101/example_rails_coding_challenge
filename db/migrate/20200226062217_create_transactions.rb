class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :currency
      t.boolean :paid, default: false
      t.boolean :refunded, default: false
      t.integer :status     
      t.references  :customer, foreign_key: true
      t.timestamps null: false
    end
  end
end
