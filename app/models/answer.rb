class Answer < ApplicationRecord
  belongs_to :formulary
  belongs_to :question
  belongs_to :visit

  validates :content, presence: true
  validates :answered_at, presence: true
end
