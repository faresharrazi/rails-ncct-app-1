class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.string :category

      t.timestamps
    end
  end
end
