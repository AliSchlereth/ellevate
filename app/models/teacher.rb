class Teacher < ApplicationRecord

  def self.update_or_create(auth)
    teacher = Teacher.find_by(uid: auth[:id]) || Teacher.new
    teacher.attributes = {
      provider: auth[:provider],
      uid: auth[:id],
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
