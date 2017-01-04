class Student < ApplicationRecord
  belongs_to :teacher
  belongs_to :pass_img

  validates :username, presence: true
  validates :level, presence: true
  validates :language, presence: true
end
