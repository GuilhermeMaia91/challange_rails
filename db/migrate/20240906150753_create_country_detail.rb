class CreateCountryDetail < ActiveRecord::Migration[7.0]
  def change
    create_table :country_details do |t|
      t.references :country, null: false, foreign_key: true, index: true
      t.string :observation, null: false
      t.string :picture

      t.timestamps
    end
  end
end
