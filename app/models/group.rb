class Group < ApplicationRecord
  validates :Name, presence: true
  validates :Icon, presence: true
  belongs_to :user, dependent: :destroy
  has_many :transacts, dependent: :destroy
end
