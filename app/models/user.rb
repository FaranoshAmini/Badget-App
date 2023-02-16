class User < ApplicationRecord
    validates :Name, presence: true
    has_many :groups
    has_many :transacts
end
