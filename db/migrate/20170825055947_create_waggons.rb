class CreateWaggons < ActiveRecord::Migration[5.1]
  def change
    create_table :waggons do |t|
      t.integer :number
      t.integer :waggon_type
      t.integer :upper_shelf
      t.integer :lower_shelf
      t.integer :side_upper_shelf
      t.integer :side_lower_shelf
      t.belongs_to :train
      t.string :type

      t.timestamps
    end
  end
end
