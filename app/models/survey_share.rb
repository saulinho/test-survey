class SurveyShare < ApplicationRecord
  belongs_to :survey

  has_many :replies, dependent: :destroy

  accepts_nested_attributes_for :replies, allow_destroy: true
end
