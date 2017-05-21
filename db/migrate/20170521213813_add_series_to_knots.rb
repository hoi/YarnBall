class AddSeriesToKnots < ActiveRecord::Migration[5.0]
  def change
    add_column :knots, :series_id, :integer
  end
end
