class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :question_type

  has_many :options, dependent: :destroy
  has_many :replies, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true
  # accepts_nested_attributes_for :replies, allow_destroy: true
end
