class Answer < ApplicationRecord
  validates :description, presence: true, length: { minimum: 50}

  belongs_to :question
end
