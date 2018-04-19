class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email, null: false, default: 'prodobro111@gmail.com'
      t.string :phone, null: false, default: '+38-032-240-99-99'

      t.timestamps
    end
  end
end
