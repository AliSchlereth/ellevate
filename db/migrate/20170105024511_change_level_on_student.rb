class ChangeLevelOnStudent < ActiveRecord::Migration[5.0]
  def change
    change_column :students, :level, :text
  end
end
