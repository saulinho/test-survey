class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :survey_share

  has_many :reply_options, dependent: :destroy

  accepts_nested_attributes_for :reply_options, allow_destroy: true
end
