class BonusTrack < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :bonus, :string
  end
end
