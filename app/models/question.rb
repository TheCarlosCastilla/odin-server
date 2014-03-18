class Question < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:content].blank? }

end
