class Teacher < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :token, presence: true

  has_many :students

  def self.update_or_create(auth)
    teacher = Teacher.find_by(uid: auth[:id]) || Teacher.new
    teacher.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    teacher.save!
    teacher
  end
end