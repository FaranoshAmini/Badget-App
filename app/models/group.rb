class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :author, class_name: 'User', dependent: :destroy
  has_many :expenses, dependent: :destroy
end
