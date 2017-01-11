module ApplicationHelper

  def determine_nav
    if current_user
      return "shared/teacher_nav" if current_user.teacher?
      return "shared/student_nav" if current_user.student?
    else
      "shared/general_nav"
    end
  end

end
