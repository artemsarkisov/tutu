class CreateWaggons < ActiveRecord::Migration[5.1]
  def change
    create_table :waggons do |t|
      t.string :waggon_type
      t.string :upper_shelf
      t.string :lower_shelf

      t.timestamps
    end
  end
end
