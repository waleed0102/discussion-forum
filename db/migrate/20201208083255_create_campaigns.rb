class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :purpose
      t.integer :estimated_duration
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
