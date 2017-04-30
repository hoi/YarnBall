class CreateYarns < ActiveRecord::Migration[5.0]
  def change
    create_table :yarns do |t|
      t.integer :pid
      t.references :user, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
