class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :language, :level, :img, :name

  def img
    object.pass_img.img
  end

end
