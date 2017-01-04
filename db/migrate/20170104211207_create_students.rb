class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :username
      t.string :level
      t.string :language
      t.references :teacher, foreign_key: true
      t.references :pass_img, foreign_key: true

      t.timestamps
    end
  end
end
