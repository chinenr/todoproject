class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :doneFlg, default: false

      t.timestamps
    end
  end
end
