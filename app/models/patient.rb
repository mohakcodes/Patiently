class Patient < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :gender, inclusion: { in: ['Male', 'Female', 'Other'] }, presence: true
  validates :contact_info, presence: true
  validates :medical_history, presence: true
end