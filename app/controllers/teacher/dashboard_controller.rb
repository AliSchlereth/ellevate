class Teacher::DashboardController < ApplicationController

  def show
    @image = PassImg.first
  end
end
