class Option < ApplicationRecord
  belongs_to :question
  has_many :reply_options, dependent: :destroy
end
