class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  has_many :group, dependent: :destroy
  has_many :expense, dependent: :destroy
end
