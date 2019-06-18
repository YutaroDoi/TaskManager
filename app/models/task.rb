class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :status, presence: true
end
