class CreatePassImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :pass_imgs do |t|
      t.string :img

      t.timestamps
    end
  end
end
