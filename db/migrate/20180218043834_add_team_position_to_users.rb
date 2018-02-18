class AddTeamPositionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :team_position, :string
  end
end
