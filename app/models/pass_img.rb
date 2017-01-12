class PassImg < ApplicationRecord
  has_many :students

  validates :img, presence: true
end
