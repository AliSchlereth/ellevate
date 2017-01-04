class Sentence < ApplicationRecord
  validates :sentence_frame, presence: true
  validates :level, presence: true
end
