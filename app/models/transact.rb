class Transact < ApplicationRecord
  validates :Name, presence: true
  validates :Amount, presence: true
  validates :Amount, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :authorid, dependent: :destroy
  has_many :groups, dependent: :destroy
end
