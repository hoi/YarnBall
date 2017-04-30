class CreateKnots < ActiveRecord::Migration[5.0]
  def change
    create_table :knots do |t|
      t.references :yarn, foreign_key: true, null: false
      t.string :details, null: false
      t.datetime :happens_at
      t.string :repeat, null: false, default: "never"
      t.boolean :done

      t.timestamps
    end
  end
end
