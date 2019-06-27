# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
  accepts_nested_attributes_for :task_labels, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :status, presence: true

  enum status: %i[todo doing done]
  enum priority: %i[low medium high]
end
