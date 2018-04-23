class RemoveStatusFromCampaign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :status, :string
  end
end
