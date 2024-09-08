class CreateCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :name_short, null: false

      t.timestamps
    end
  end
end
