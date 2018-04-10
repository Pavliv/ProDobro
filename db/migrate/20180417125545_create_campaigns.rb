class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.string :status
      t.decimal :current_amount, default: 0.0
      t.decimal :needed_amount
      t.string :requisite
      t.integer :category_id
      t.datetime :finished_at
      t.integer :user_id

      t.timestamps
    end
  end
end
