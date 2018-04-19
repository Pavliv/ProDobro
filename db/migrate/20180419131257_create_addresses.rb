class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :contact
      t.string :country, null: false, default: 'Ukraine'
      t.string :street, null: false, default: 'Pasternaka'
      t.string :building_number, null: false, default: '5a'
      t.string :city, null: false, default: 'Lviv'

      t.timestamps
    end
  end
end
