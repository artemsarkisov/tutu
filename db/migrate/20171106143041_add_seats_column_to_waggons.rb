class AddSeatsColumnToWaggons < ActiveRecord::Migration[5.1]
  def change
    add_column :waggons, :seat, :integer
  end
end
