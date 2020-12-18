class AddCampaignToTags < ActiveRecord::Migration[6.0]
  def change
    add_reference :tags, :campaign, null: false, foreign_key: true
  end
end
