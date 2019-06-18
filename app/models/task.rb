class Task < ApplicationRecord
    validates :name, presence: true, length: { maximun: 50 }
    validates :status, presence: true
end
