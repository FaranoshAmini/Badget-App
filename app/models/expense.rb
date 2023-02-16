class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user, class_name: 'User', dependent: :destroy
end
