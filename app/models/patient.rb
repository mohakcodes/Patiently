class Patient < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :gender, inclusion: { in: [ "Male", "Female", "Other" ] }, presence: true
  validates :contact_info, presence: true
  validates :medical_history, presence: true

  scope :registrations_per_day, -> {
    where(is_deleted: false).group_by_day(:created_at).count
  }

  def soft_delete
    update(is_deleted: true)
  end
end