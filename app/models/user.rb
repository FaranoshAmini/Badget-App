class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  has_many :groups, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
