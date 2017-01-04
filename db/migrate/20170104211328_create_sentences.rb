class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.string :sentence_frame
      t.integer :level

      t.timestamps
    end
  end
end
