class Survey < ApplicationRecord
  acts_as_tenant :company
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
end
