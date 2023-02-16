class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user, class_name: 'User', dependent: :destroy
  has_many :expense, dependent: :destroy
end
