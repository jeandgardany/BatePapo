class CreateJoinTableSalaUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :salas, :users do |t|
      # t.index [:sala_id, :user_id]
      # t.index [:user_id, :sala_id]
    end
  end
end
