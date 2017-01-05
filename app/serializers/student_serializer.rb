class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :language, :level :img

  def img
    object.pass_img.img
  end
  
end
