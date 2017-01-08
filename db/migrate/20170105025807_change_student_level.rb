class ChangeStudentLevel < ActiveRecord::Migration[5.0]
  def change
    change_column :students, :level, 'integer USING CAST(level AS integer)'
  end
end
