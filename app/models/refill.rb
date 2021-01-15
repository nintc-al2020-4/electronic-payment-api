class Refill < ApplicationRecord
  belongs_to :wallet

  validates :amount, numericality: { greater_than: 0, only_integer: true }

  after_create  :refill
  after_destroy :rollback


  private

  def refill
    self.wallet.add_balance self.amount
    self.wallet.save!
  end

  def rollback
    self.wallet.subtract_balance self.amount
    self.wallet.save!
  end

end
