class Payment < ApplicationRecord
  belongs_to :wallet

  validates :amount, numericality: { greater_than: 0, only_integer: true }

  after_create :pay


  private

  def pay
    self.wallet.subtract_balance self.amount
    self.wallet.save!
  end
end
