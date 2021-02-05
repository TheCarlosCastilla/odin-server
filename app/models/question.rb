class Question < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, reject_if: proc { |a| a[:choice_text].blank? }

end
