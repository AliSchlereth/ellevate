module ApplicationHelper

  def current_students
    current_user.students.order(:level)
  end
end
