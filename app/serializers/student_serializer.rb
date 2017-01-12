class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :language, :level, :img, :name, :teacher_id

  def img
    object.pass_img.img
  end
end
