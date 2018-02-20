class AddTeamPriorityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :team_priority, :integer
  end
end
