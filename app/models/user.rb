class User < ApplicationRecord
  validates :Name, presence: true
  has_many :groups, dependent: :destroy
  has_many :transacts, dependent: :destroy
end
