class DeletePhoneNumber < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number, :string, null: false, default: ''
  end
end
