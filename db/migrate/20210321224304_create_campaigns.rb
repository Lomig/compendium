class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.references :game, null: false, foreign_key: true
      t.references :game_master, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
