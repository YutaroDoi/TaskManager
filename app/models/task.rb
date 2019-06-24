class Task < ApplicationRecord
    belongs_to :user
    has_many :labels, through: :task_labels
    has_many :task_labels

    validates :name, presence: true, length: { maximum: 50 }
    validates :status, presence: true

    enum status: [:todo, :doing, :done]
    enum priority: [:low, :medium, :high]
end
