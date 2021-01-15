class User < ApplicationRecord
  has_secure_password

  has_one :wallet, dependent: :destroy
  has_many :sessions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 16 }
  validates :email, presence: true, length: { maximum: 254 },
            format: { with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*\z/, allow_blank: true }

  before_validation :generate_wallet


  def generate_wallet
    self.wallet = Wallet.new unless self.wallet.present?
  end
end
