class Wallet < ApplicationRecord
  has_many :refills

  belongs_to :user

  validates :balance, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def add_balance(amount)
    if amount <= 0
      raise ArgumentError, "Amount must be greater than 0."
    end

    self.balance += amount
  end

  def subtract_balance(amount)
    if amount <= 0
      raise ArgumentError, "Amount must be greater than 0."
    end

    if self.balance < amount
      raise ArgumentError, "There is NOT enough balance."
    end

    self.balance -= amount
  end
end
