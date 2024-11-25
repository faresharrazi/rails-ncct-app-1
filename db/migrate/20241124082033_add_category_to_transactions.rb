class AddCategoryToTransactions < ActiveRecord::Migration[8.0]
  def change
     add_reference :transactions, :category, foreign_key: true, null: true
  end
end
