class CreateWins < ActiveRecord::Migration[7.0]
  def change
    create_table :wins do |t|
      t.text :entry
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
