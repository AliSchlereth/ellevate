class Student < ApplicationRecord
  belongs_to :teacher
  belongs_to :pass_img

  validates :username, presence: true
  validates :level, presence: true
  validates :language, presence: true

  def sentence_frame
    random_selector = rand(1..20)
    Sentence.where(level: level)[random_selector]
  end
end
