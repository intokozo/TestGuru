class Answer < ApplicationRecord
  MAX_ANSWERS = 4
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  validates :body, presence: true

  validate :validate_max_number, on: :create

  private

  def validate_max_number
    return if question.answers.count > MAX_ANSWERS

    errors.add(:base, "Question should have no more than #{MAX_ANSWERS} answers")
  end
end
