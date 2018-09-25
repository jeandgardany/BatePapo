class CreateSolicitations < ActiveRecord::Migration[5.2]
  def change
    create_table :solicitations do |t|
      t.references :user, foreign_key: true
      t.references :sala, foreign_key: true
      t.text :texto
      t.boolean :concluida, default: false

      t.timestamps
    end
  end
end
