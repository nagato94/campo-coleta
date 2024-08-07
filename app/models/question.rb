class Question < ApplicationRecord
  belongs_to :formulary

  validates :name, presence: true, uniqueness: { scope: :formulary_id }
  validates :question_type, presence: true
end
