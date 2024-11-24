class Transaction < ApplicationRecord
  belongs_to :account

    # Optional: Add validations
    validates :title, :amount, presence: true
    validates :amount, numericality: { greater_than: 0 }
    validate :sufficient_balance
      
  after_create :deduct_from_account_balance

  private

  def deduct_from_account_balance
    if account
      # Deduct the transaction amount from the account balance
      account.update(balance: account.balance - amount)
    end
  end
  
   def sufficient_balance
    if account && amount > account.balance
      errors.add(:amount, "exceeds the account's available balance")
    end
  end

end
