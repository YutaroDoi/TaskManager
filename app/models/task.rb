class Task < ApplicationRecord
    belongs_to :users

    validates :name, presence: true, length: { maximum: 50 }
    validates :status, presence: true

    enum status: [:todo, :doing, :done]
    enum priority: [:low, :medium, :high]
end
