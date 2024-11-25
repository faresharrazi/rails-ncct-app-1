class Account < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :transactions, dependent: :destroy

    # Optional: Add validations
    validates :name, presence: true
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
